import UIKit
import SwiftUI
// MARK: - UserGeneratorViewController
class UserGeneratorViewController: UIViewController {
    // MARK: - Properties
    var safeArea: UILayoutGuide!
    let dataView: DataCardView = DataCardView()
    let userGenerateButton: UIButton = UIButton(type:.system)
    let navigateButton: UIButton = UIButton(type:.system)
    let errorMessageLabel = UILabel()
    private let assemblerInjector : RamdomUserAssemblerInjector = RamdomUserAssemblerInjector()
    private var presenter : UserGeneratorPresenterProtocol!
    let constants: Constants = Constants()
    lazy var ratingView = createRatingView()
    private var rating = Rating()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        navigationItem.title = constants.titleViewController
        style()
        layout()
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
// MARK: - UI
extension UserGeneratorViewController {
    private func style() {
        //UserGeneratorViewController
        view.backgroundColor = .systemBackground
        //DataView
        dataView.translatesAutoresizingMaskIntoConstraints = false
        //Button
        userGenerateButton.translatesAutoresizingMaskIntoConstraints = false
        userGenerateButton.configuration = .filled()
        userGenerateButton.configuration?.imagePadding = constants.imagePadding
        userGenerateButton.setTitle(constants.titleButton, for: [])
        userGenerateButton.addTarget(self, action: #selector(generateTapped), for: .primaryActionTriggered)
        //ErrorLabel
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = .zero
        errorMessageLabel.text = constants.messageDefault
        errorMessageLabel.isHidden = true
        //NavigateButton
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.configuration = .filled()
        navigateButton.configuration?.imagePadding = constants.imagePadding
        navigateButton.setTitle(constants.titleNavigateButton, for: [])
        navigateButton.addTarget(self, action: #selector(navigateTapped), for: .touchUpInside)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(dataView)
        view.addSubview(userGenerateButton)
        view.addSubview(errorMessageLabel)
        //navigateButton
        view.addSubview(navigateButton)
        //RatingView
        view.addSubview(ratingView)
        //DataView
        NSLayoutConstraint.activate([
            safeArea.topAnchor.constraint(equalTo: dataView.topAnchor),
            safeArea.trailingAnchor.constraint(equalToSystemSpacingAfter: dataView.trailingAnchor, multiplier: constants.constraintSafeArea),
            dataView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeArea.leadingAnchor, multiplier: constants.constraintDataView)
        ])
        //Button
        NSLayoutConstraint.activate([
            userGenerateButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -constants.constraintBottomButton),
            userGenerateButton.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            userGenerateButton.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            userGenerateButton.heightAnchor.constraint(equalToConstant: constants.constraintHeightButton)
        ])
        //ErrorLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: dataView.bottomAnchor, multiplier: constants.constraintTopErrorLabel),
            errorMessageLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: dataView.trailingAnchor)
        ])
        //Navigate Button
        NSLayoutConstraint.activate([
            navigateButton.bottomAnchor.constraint(equalTo: userGenerateButton.topAnchor, constant: -20),
            navigateButton.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            navigateButton.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            navigateButton.heightAnchor.constraint(equalToConstant: constants.constraintHeightButton)
        ])
        //RatingView
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalToSystemSpacingBelow: dataView.bottomAnchor, multiplier: constants.constraintTopErrorLabel),
            ratingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func createRatingView() -> UIView {
        let hostingController = UIHostingController(rootView: RatingViewContainer(rating: rating))
        guard let ratingView = hostingController.view else { return UIView() }
        //addChild(hostingController)
        return ratingView
    }
}
// MARK: - Actions
extension UserGeneratorViewController {
    @objc func generateTapped(sender: UIButton) {
        self.presenter.retrieveUserData()
    }
    
    @objc func navigateTapped(sender: UIButton) {
        present(UIHostingController(rootView: StockListScreen()), animated: true)
    }
    
    private func configureErrorView(withMessage message: String) {
        errorMessageLabel.isHidden = true
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
        dataView.userImageView.loadImageUsingCache(withUrl: urlString)
        dataView.usernameLabel.text = "\(constants.greetingOne) \(userData.firstName ?? "") \(userData.lastName ?? "")"
        dataView.userDataLabel.text = "\(constants.greetingTwo) \(userData.age ?? 0) \(constants.greetingThree) \(userData.country ?? "")\(constants.greetingFour) \(userData.phone ?? "") \(constants.greetingFive) \(userData.email ?? "")"
        clearErrorMessageLabel()
    }
    
    func clearErrorMessageLabel() {
        if errorMessageLabel.text != ""{
            errorMessageLabel.text = String()
            errorMessageLabel.isHidden = true
        }
    }
}
