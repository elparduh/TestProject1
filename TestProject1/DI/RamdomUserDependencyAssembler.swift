import Foundation


protocol RamdomUserDependencyAssembler {
  func resolve(userGeneratorViewProtocol: UserGeneratorViewProtocol) -> UserGeneratorPresenterProtocol
  func resolve() -> RamdomUserProviderProtocol
  func resolve() -> RamdomUserRepositoryProtocol
  func resolve() -> RamdomUserAPIDataSourceProtocol
  func resolve() -> DataTransferServiceProtocol
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
                              backgroundQueue: DispatchQueue.main)
  }

  func resolve() -> DataTransferServiceProtocol {
      DataTransferService()
  }
}

struct RamdomUserAssemblerInjector : RamdomUserDependencyAssembler {}
