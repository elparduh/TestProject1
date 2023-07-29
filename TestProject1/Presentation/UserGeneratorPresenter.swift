import Foundation

protocol UserGeneratorPresenterProtocol {
    func retrieveUserData()
}

protocol UserGeneratorViewProtocol {
    func showError(_ error: String)
    func showLoader()
    func hideLoader()
    func diplayUserData(_ userData: UserData)
}

struct UserGeneratorPresenter: UserGeneratorPresenterProtocol {
    private var ramdomUserProvider: RamdomUserProviderProtocol
    private var userGeneratorView: UserGeneratorViewProtocol
    let constants: Constants = Constants()
    
    init(ramdomUserProvider: RamdomUserProviderProtocol,
         userGeneratorView: UserGeneratorViewProtocol) {
        self.ramdomUserProvider = ramdomUserProvider
        self.userGeneratorView = userGeneratorView
    }
    
    func retrieveUserData() {
        userGeneratorView.showLoader()
        ramdomUserProvider.getRamdomUserProvider().execute { responseData in
            userGeneratorView.hideLoader()
            switch responseData {
            case .success(let userData):
                userGeneratorView.diplayUserData(userData)
            case .failure(let error):
                userGeneratorView.showError(error.localizedDescription)
            }
        }
    }
}
