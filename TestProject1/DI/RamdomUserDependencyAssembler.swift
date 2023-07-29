import Foundation


protocol RamdomUserDependencyAssembler {
    func resolve(userGeneratorViewProtocol: UserGeneratorViewProtocol) -> UserGeneratorPresenterProtocol
    func resolve() -> RamdomUserProviderProtocol
    func resolve() -> RamdomUserRepositoryProtocol
    func resolve() -> RamdomUserAPIDataSourceProtocol
    func resolve() -> DataTransferServiceProtocol
    func resolve() -> NetworkServiceProtocol
    func resolve() -> NetworkSessionManagerProtocol
}

extension RamdomUserDependencyAssembler {
    
    func resolve(userGeneratorViewProtocol: UserGeneratorViewProtocol) -> UserGeneratorPresenterProtocol {
        UserGeneratorPresenter(ramdomUserProvider: resolve(),
                               userGeneratorView: userGeneratorViewProtocol)
    }
    
    func resolve() -> RamdomUserProviderProtocol {
        RamdomUserProvider(ramdomUserRepository: resolve())
    }
    
    func resolve() -> RamdomUserRepositoryProtocol {
        RamdomUserRepository(ramdomUserAPIDataSource: resolve())
    }
    
    func resolve() -> RamdomUserAPIDataSourceProtocol {
        RamdomUserAPIDataSource(dataTransferService: resolve(),
                                dispatchQueue: DispatchQueue.main)
    }
    
    func resolve() -> DataTransferServiceProtocol {
        DataTransferService(networkService: resolve(),
                            errorResolver: DataTransferErrorResolver())
    }
    
    func resolve() -> NetworkServiceProtocol {
        NetworkService(sessionManager: resolve())
    }
    
    func resolve() -> NetworkSessionManagerProtocol {
        NetworkSessionManager()
    }
}

struct RamdomUserAssemblerInjector : RamdomUserDependencyAssembler {}
