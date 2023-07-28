import Foundation

protocol RamdomUserUseCaseProtocol {
  func execute(completion: @escaping (Result<UserData,Error>) -> Void)
}

struct RamdomUserUseCase: RamdomUserUseCaseProtocol {
    
    private var ramdomUserRepository: RamdomUserRepositoryProtocol
    
    init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
        self.ramdomUserRepository = ramdomUserRepository
    }
    
    func execute(completion: @escaping (Result<UserData, Error>) -> Void) {
        ramdomUserRepository.getRamdomUser { resultData in
          completion(resultData)
        }
    }
}
