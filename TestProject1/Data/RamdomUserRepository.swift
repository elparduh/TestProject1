import Foundation

protocol RamdomUserRepositoryProtocol {
    func getRamdomUser(completion: @escaping (Result<UserData,Error>) -> Void)
}

struct RamdomUserRepository: RamdomUserRepositoryProtocol {
    private var ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol
    
    init(ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol){
        self.ramdomUserAPIDataSource = ramdomUserAPIDataSource
    }
    
    func getRamdomUser(completion: @escaping (Result<UserData, Error>) -> Void) {
        ramdomUserAPIDataSource.getRamdomUser { resultUserData  in
            completion(resultUserData)
        }
    }
    
}
