import Foundation

protocol RamdomUserRepositoryProtocol {
    var ramdomUserAPIDataSource: RamdomUserAPIDataSourceProtocol { get }
    func getRamdomUser(completion: @escaping (Result<UserData,Error>) -> Void)
}

struct RamdomUserRepository: RamdomUserRepositoryProtocol {
    let ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol
    
    init(ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol){
        self.ramdomUserAPIDataSource = ramdomUserAPIDataSource
    }
    
    func getRamdomUser(completion: @escaping (Result<UserData, Error>) -> Void) {
        ramdomUserAPIDataSource.getRamdomUser { resultUserData  in
            completion(resultUserData)
        }
    }
    
}
