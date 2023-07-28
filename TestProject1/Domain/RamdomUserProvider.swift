import Foundation

protocol RamdomUserProviderProtocol {
    func getRamdomUserProvider() -> RamdomUserUseCase
}

struct RamdomUserProvider: RamdomUserProviderProtocol {
    
    private var ramdomUserRepository: RamdomUserRepositoryProtocol
    
    init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
        self.ramdomUserRepository = ramdomUserRepository
    }
    
    func getRamdomUserProvider() -> RamdomUserUseCase {
        RamdomUserUseCase(ramdomUserRepository: ramdomUserRepository)
    }
}
