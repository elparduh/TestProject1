import UIKit
// MARK: - UserGeneratorViewController
class UserGeneratorViewController: UIViewController {
    // MARK: - Properties
    let dataCardView: DataCardView = DataCardView()
    let mainStackView: UIStackView = UIStackView()
    let userGenerateButton:UIButton = UIButton()
    let errorMessageLabel:UILabel = UILabel()
    private let assemblerInjector : RamdomUserAssemblerInjector = RamdomUserAssemblerInjector()
    private var presenter : UserGeneratorPresenterProtocol!
    let constants: Constants = Constants()
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
        self.presenter.retrieveUserData()
    }
    
    private func initializePresenter() {
        self.presenter = assemblerInjector.resolve(userGeneratorViewProtocol: self)
    }
}

// MARK: - Actions
extension UserGeneratorViewController {
    
    @objc func generateTapped(sender: UIButton) {
        self.presenter.retrieveUserData()
    }
    
    private func configureErrorView(withMessage message: String) {
        dataCardView.isHidden = true
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeButton()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = constants.animationPosition
        animation.values = constants.animationValues
        animation.keyTimes = constants.animationTimes
        animation.duration = constants.animationDuration
        animation.isAdditive = true
        userGenerateButton.layer.add(animation, forKey: constants.animationKey)
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
        guard let urlString = userData.picture else { return }
        dataCardView.userImageView.loadImageUsingCache(withUrl: urlString)
        dataCardView.usernameLabel.text = "\(constants.greetingOne) \(userData.firstName ?? "") \(userData.lastName ?? "")"
        dataCardView.userDataLabel.text = "\(constants.greetingTwo) \(userData.age ?? 0) \(constants.greetingThree) \(userData.country ?? "")\(constants.greetingFour) \(userData.phone ?? "") \(constants.greetingFive) \(userData.email ?? "")"
        clearErrorMessageLabel()
    }
    
    func clearErrorMessageLabel() {
        if errorMessageLabel.text != ""{
            errorMessageLabel.text = String()
            errorMessageLabel.isHidden = true
            dataCardView.isHidden = false
        }
    }
}
