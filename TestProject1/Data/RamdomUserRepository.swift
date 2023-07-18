import Foundation

protocol RamdomUserRepositoryProtocol {
  func getRamdomUser(completion: @escaping (Result<RamdomUserModel,Error>) -> Void)
}

struct RamdomUserRepository: RamdomUserRepositoryProtocol {
    
    private var ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol

    init(ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol){
      self.ramdomUserAPIDataSource = ramdomUserAPIDataSource
    }
    
    func getRamdomUser(completion: @escaping (Result<RamdomUserModel, Error>) -> Void) {
        ramdomUserAPIDataSource.getRamdomUser { resultData  in
            completion(resultData)
        }
    }
    
}
