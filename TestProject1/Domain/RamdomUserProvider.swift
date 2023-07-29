import Foundation

protocol RamdomUserProviderProtocol {
    var ramdomUserRepository: RamdomUserRepositoryProtocol { get }
    func getRamdomUserProvider() -> RamdomUserUseCase
}

struct RamdomUserProvider: RamdomUserProviderProtocol {
    let ramdomUserRepository: RamdomUserRepositoryProtocol
    
    init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
        self.ramdomUserRepository = ramdomUserRepository
    }
    
    func getRamdomUserProvider() -> RamdomUserUseCase {
        RamdomUserUseCase(ramdomUserRepository: ramdomUserRepository)
    }
}
