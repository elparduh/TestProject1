import Foundation

enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkFailure(NetworkError)
    case resolvedNetworkFailure(Error)
}

protocol DataTransferDispatchQueue {
    func asyncExecute(work: @escaping () -> Void)
}

extension DispatchQueue: DataTransferDispatchQueue {
    
    func asyncExecute(work: @escaping () -> Void) {
        async(group: nil, execute: work)
    }
}

protocol DataTransferErrorResolverProtocol {
    func resolve(error: NetworkError) -> Error
}

struct DataTransferErrorResolver: DataTransferErrorResolverProtocol {
    
    func resolve(error: NetworkError) -> Error {
        error
    }
}

protocol DataTransferServiceProtocol {
    typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void
    @discardableResult
    func get<T>(type: T.Type,
                endpoint: Endpoint,
                queue: DataTransferDispatchQueue,
                completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where T: Decodable
}

struct DataTransferService: DataTransferServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private let errorResolver: DataTransferErrorResolverProtocol
    
    init(networkService: NetworkServiceProtocol,
         errorResolver: DataTransferErrorResolverProtocol) {
        self.networkService = networkService
        self.errorResolver = errorResolver
    }
    
    @discardableResult
    func get<T>(type: T.Type, endpoint: Endpoint, queue: DataTransferDispatchQueue, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where T : Decodable {
        networkService.request(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                let result: Result<T, DataTransferError> = self.decode(data: data)
                queue.asyncExecute { completion(result) }
            case .failure(let error):
                let error = self.resolve(networkError: error)
                queue.asyncExecute { completion(.failure(error)) }
            }
        }
    }
    
    private func decode<T: Decodable>(data: Data?) -> Result<T, DataTransferError> {
        do {
            guard let data = data else { return .failure(.noResponse) }
            let result = try JSONDecoder().decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(.parsing(error))
        }
    }
    
    private func resolve(networkError error: NetworkError) -> DataTransferError {
        let resolvedError = self.errorResolver.resolve(error: error)
        return resolvedError is NetworkError
        ? .networkFailure(error)
        : .resolvedNetworkFailure(resolvedError)
    }
}
