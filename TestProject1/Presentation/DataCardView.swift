import UIKit

class DataCardView: UIView {
  // MARK: - Properties
  let stackView = UIStackView()
  let userImageView = UIImageView()
  let usernameLabel = UILabel()
  let userDataLabel = UILabel()
  let dividerView: UIView = UIView()
  let constants: Constants = Constants()
  // MARK: - Constructor
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
// MARK: - UI
extension DataCardView {
    
  func style() {
    //stackView
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = constants.spacing
    //userImageView
    userImageView.translatesAutoresizingMaskIntoConstraints = false
    userImageView.contentMode = .scaleAspectFit
    //usernameLabel
    usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    usernameLabel.textAlignment = .center
    usernameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    usernameLabel.adjustsFontForContentSizeCategory = true
    usernameLabel.numberOfLines = .zero
    //dividerView
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.backgroundColor = .secondarySystemFill
    //userDataLabel
    userDataLabel.translatesAutoresizingMaskIntoConstraints = false
    userDataLabel.textAlignment = .center
    userDataLabel.font = UIFont.preferredFont(forTextStyle: .body)
    userDataLabel.adjustsFontForContentSizeCategory = true
    userDataLabel.numberOfLines = .zero
    //DataCardView
    backgroundColor = .secondarySystemBackground
    layer.cornerRadius = constants.cornerRadius
    clipsToBounds = true
  }

  func layout() {
    stackView.addArrangedSubview(userImageView)
    stackView.addArrangedSubview(usernameLabel)
    stackView.addArrangedSubview(dividerView)
    stackView.addArrangedSubview(userDataLabel)
    addSubview(stackView)
      
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: constants.constraintTop),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: constants.constraintLeading),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: constants.constraintTrailing),
      bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: constants.constraintBottom)
    ])
    dividerView.heightAnchor.constraint(equalToConstant: constants.constraintHeight).isActive = true
  }
}


