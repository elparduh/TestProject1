import Foundation

enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}

protocol NetworkCancellable {
    func cancel()
}

extension URLSessionTask: NetworkCancellable { }

protocol NetworkServiceProtocol {
    typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    func request(endpoint: Endpoint,
                 completion: @escaping CompletionHandler) -> NetworkCancellable?
}

struct NetworkService: NetworkServiceProtocol {
    
    private let sessionManager: NetworkSessionManagerProtocol
    
    init(sessionManager: NetworkSessionManagerProtocol) {
        self.sessionManager = sessionManager
    }
    
    func request(endpoint: Endpoint, completion: @escaping CompletionHandler) -> NetworkCancellable? {
        do {
            let urlRequest = try endpoint.urlRequest()
            return requestData(request: urlRequest, completion: completion)
        } catch {
            completion(.failure(.urlGeneration))
            return nil
        }
    }
    
    private func requestData(request: URLRequest,
                             completion: @escaping CompletionHandler) -> NetworkCancellable {
        let sessionDataTask = sessionManager.request(request) { data, response, requestError in
            
            if let requestError = requestError {
                var error: NetworkError
                if let response = response as? HTTPURLResponse {
                    error = .error(statusCode: response.statusCode, data: data)
                } else {
                    error = self.resolve(error: requestError)
                }
                completion(.failure(error))
            } else {
                completion(.success(data))
            }
        }
        
        return sessionDataTask
    }
    
    private func resolve(error: Error) -> NetworkError {
        
        let codeError = URLError.Code(rawValue: (error as NSError).code)
        
        switch codeError {
        case .notConnectedToInternet: return .notConnected
        case .cancelled: return .cancelled
        default: return .generic(error)
        }
    }
}

protocol NetworkSessionManagerProtocol {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable
}

struct NetworkSessionManager: NetworkSessionManagerProtocol {
    
    func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}

