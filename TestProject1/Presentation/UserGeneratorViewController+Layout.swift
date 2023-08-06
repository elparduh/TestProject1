import UIKit

extension UserGeneratorViewController {
    
    func addSubviews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(dataCardView)
        mainStackView.addArrangedSubview(errorMessageLabel)
        mainStackView.addArrangedSubview(userGenerateButton)
    }
    
    func addConstraints() {
        let layoutGuide = view.safeAreaLayoutGuide
        configureMainStackView(layoutGuide)
        configureErrorMessageLabel()
        configureUserGenerateButton()
    }
    
    private func configureMainStackView(_ layoutGuide: UILayoutGuide) {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor)
        ])
    }
            
    private func configureErrorMessageLabel() {
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = .zero
        errorMessageLabel.text = constants.messageDefault
        errorMessageLabel.isHidden = true
    }
    
    private func configureUserGenerateButton() {
        userGenerateButton.configuration = .plain()
        userGenerateButton.setTitle(constants.titleButton, for: [])
        userGenerateButton.addTarget(self, action: #selector(generateTapped), for: .touchUpInside)
    }
}
