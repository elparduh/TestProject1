import UIKit
// MARK: - UserGeneratorViewController
class UserGeneratorViewController: UIViewController {
    // MARK: - Properties
    let dataCardView: DataCardView = DataCardView()
    let mainStackView: UIStackView = UIStackView()
    let userGenerateButton: UIButton = UIButton()
    let errorMessageLabel: UILabel = UILabel()
    lazy var userDataView: UIView = createUserDataView()
    private let assemblerInjector: RamdomUserAssemblerInjector = RamdomUserAssemblerInjector()
    private var presenter: UserGeneratorPresenterProtocol!
    private let constants: Constants = Constants()
    let userDataModel: UserDataModel = UserDataModel()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = constants.titleViewController
        addSubviews()
        addConstraints()
        initializePresenter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.retrieveUserData()
    }
    
    private func initializePresenter() {
        presenter = assemblerInjector.resolve(userGeneratorViewProtocol: self)
    }
}

// MARK: - Actions
extension UserGeneratorViewController {
    
    @objc func generateTapped(sender: UIButton) {
        presenter.retrieveUserData()
    }
    
    private func configureErrorView(withMessage message: String) {
        dataCardView.isHidden = true
        userDataView.isHidden = true
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        userGenerateButton.shakeButton()
    }
}
// MARK: - Show Data and Response
extension UserGeneratorViewController: UserGeneratorViewProtocol {
    
    func showError(_ error: String) {
        configureErrorView(withMessage: error)
    }
    
    func showLoader() {
        userGenerateButton.configuration?.showsActivityIndicator = true
    }
    
    func hideLoader() {
        userGenerateButton.configuration?.showsActivityIndicator = false
    }
    
    func diplayUserData(_ userData: UserData) {
        dataCardView.dataCardViewBind(userData)
        userDataModel.name = userData.firstName ?? String()
        userDataModel.phone = userData.phone ?? String()
        userDataModel.email = userData.email ?? String()
        clearErrorMessageLabel()
    }
    
    func clearErrorMessageLabel() {
        errorMessageLabel.text = String()
        errorMessageLabel.isHidden = true
        dataCardView.isHidden = false
        userDataView.isHidden = false
    }
}
