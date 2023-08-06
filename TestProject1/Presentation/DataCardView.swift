import UIKit

class DataCardView: UIView {
    // MARK: - Properties
    private let mainStackView = UIStackView()
    private let userImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let userDataLabel = UILabel()
    private let dividerView: UIView = UIView()
    private let constants: Constants = Constants()
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        addConstraints()
    }
    
    func dataCardViewBind(_ userData: UserData) {
        guard let urlString = userData.picture else { return }
        userImageView.loadImageUsingCache(withUrl: urlString)
        usernameLabel.text = "\(constants.greetingOne) \(userData.firstName ?? "") \(userData.lastName ?? "")"
        userDataLabel.text = "\(constants.greetingTwo) \(userData.age ?? 0) \(constants.greetingThree) \(userData.country ?? "")\(constants.greetingFour) \(userData.phone ?? "") \(constants.greetingFive) \(userData.email ?? "")"
    }
}
// MARK: - UI
extension DataCardView {
    
    func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(userImageView)
        mainStackView.addArrangedSubview(usernameLabel)
        mainStackView.addArrangedSubview(dividerView)
        mainStackView.addArrangedSubview(userDataLabel)
    }
    
    func addConstraints() {
        configureMainView()
        configureMainStackView()
        configureUserImageView()
        configureUsernameLabel()
        configureDividerView()
        configureUserDataLabel()
    }
    
    private func configureMainView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = constants.cornerRadius
        clipsToBounds = true
    }
    
    private func configureMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = constants.spacing
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor,
                                               multiplier: constants.constraintTop),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor,
                                                   multiplier: constants.constraintLeading),
            trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor,
                                      multiplier: constants.constraintTrailing),
            bottomAnchor.constraint(equalToSystemSpacingBelow: mainStackView.bottomAnchor,
                                    multiplier: constants.constraintBottom)
        ])
    }
    
    private func configureUserImageView() {
        userImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalToConstant: 150),
            userImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureUsernameLabel() {
        usernameLabel.textAlignment = .center
        usernameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        usernameLabel.adjustsFontForContentSizeCategory = true
        usernameLabel.numberOfLines = .zero
    }
    
    private func configureDividerView() {
        dividerView.backgroundColor = .secondarySystemFill
        dividerView.heightAnchor.constraint(equalToConstant: constants.constraintHeight).isActive = true
    }
    
    private func configureUserDataLabel() {
        userDataLabel.textAlignment = .center
        userDataLabel.font = UIFont.preferredFont(forTextStyle: .body)
        userDataLabel.adjustsFontForContentSizeCategory = true
        userDataLabel.numberOfLines = .zero
    }
}


