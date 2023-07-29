import Foundation

protocol RamdomUserUseCaseProtocol {
    var ramdomUserRepository: RamdomUserRepositoryProtocol { get }
    func execute(completion: @escaping (Result<UserData,Error>) -> Void)
}

struct RamdomUserUseCase: RamdomUserUseCaseProtocol {
    let ramdomUserRepository: RamdomUserRepositoryProtocol
    
    init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
        self.ramdomUserRepository = ramdomUserRepository
    }
    
    func execute(completion: @escaping (Result<UserData, Error>) -> Void) {
        ramdomUserRepository.getRamdomUser { resultData in
            completion(resultData)
        }
    }
}
