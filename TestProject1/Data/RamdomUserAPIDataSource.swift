import Foundation

protocol RamdomUserAPIDataSourceProtocol {
    var dataTransferService: DataTransferServiceProtocol { get }
    func getRamdomUser(completion: @escaping (Result<UserData, Error>) -> Void)
}

struct RamdomUserAPIDataSource: RamdomUserAPIDataSourceProtocol {
    
    let dataTransferService: DataTransferServiceProtocol
    let dispatchQueue: DataTransferDispatchQueue
    
    init(dataTransferService: DataTransferServiceProtocol,
         dispatchQueue: DataTransferDispatchQueue) {
        self.dataTransferService = dataTransferService
        self.dispatchQueue = dispatchQueue
    }
    
    func getRamdomUser(completion: @escaping (Result<UserData, Error>) -> Void) {
        dataTransferService.get(type: RamdomUserModel.self, endpoint: RamdomUserEndPoint.getUser, queue: dispatchQueue) { result in
            switch result {
            case .success(let ramdomUserResponse):
                completion(.success(ramdomUserResponse.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
