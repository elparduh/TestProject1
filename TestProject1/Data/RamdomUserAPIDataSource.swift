import Foundation

protocol RamdomUserAPIDataSourceProtocol {
    var dataTransferService: DataTransferServiceProtocol { get }
    func getRamdomUser(completion: @escaping (Result<UserData,Error>) -> Void)
}

struct RamdomUserAPIDataSource: RamdomUserAPIDataSourceProtocol {
    
    let dataTransferService: DataTransferServiceProtocol
    let backgroundQueue: DataTransferDispatchQueue
    
    init(dataTransferService: DataTransferServiceProtocol = DataTransferService(),
         backgroundQueue: DataTransferDispatchQueue = DispatchQueue.global(qos: .userInitiated)) {
        self.dataTransferService = dataTransferService
        self.backgroundQueue = backgroundQueue
    }
    
    func getRamdomUser(completion: @escaping (Result<UserData, Error>) -> Void) {
        dataTransferService.get(type: RamdomUserModel.self, endpoint: RamdomUserEndPoint.getUser, queue: backgroundQueue) { result in
            switch result {
            case .success(let ramdomUserResponse):
                completion(.success(ramdomUserResponse.toDomain()))
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
