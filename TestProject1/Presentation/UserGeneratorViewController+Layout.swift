import UIKit

extension UserGeneratorViewController {
    
    func addSubviews() {
        view.addSubview(dataView)
        view.addSubview(userGenerateButton)
        view.addSubview(errorMessageLabel)
    }
    
    func addConstraints() {
        let layoutGuide = view.layoutMarginsGuide
        configureDataView(layoutGuide)
        configureUserGenerateButton(layoutGuide)
        configureErrorMessageLabel()
    }
    
    private func configureDataView(_ layoutGuide: UILayoutGuide) {
        dataView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            layoutGuide.topAnchor.constraint(equalTo: dataView.topAnchor),
            layoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: dataView.trailingAnchor,
                                                  multiplier: constants.constraintSafeArea),
            dataView.leadingAnchor.constraint(equalToSystemSpacingAfter: layoutGuide.leadingAnchor,
                                              multiplier: constants.constraintDataView)
        ])
    }
    
    private func configureUserGenerateButton(_ layoutGuide: UILayoutGuide) {
        userGenerateButton.translatesAutoresizingMaskIntoConstraints = false
        userGenerateButton.configuration = .filled()
        userGenerateButton.configuration?.imagePadding = constants.imagePadding
        userGenerateButton.setTitle(constants.titleButton, for: [])
        userGenerateButton.addTarget(self, action: #selector(generateTapped), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            userGenerateButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor,
                                                       constant: -constants.constraintBottomButton),
            userGenerateButton.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            userGenerateButton.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            userGenerateButton.heightAnchor.constraint(equalToConstant: constants.constraintHeightButton)
        ])
    }
    
    private func configureErrorMessageLabel() {
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = .zero
        errorMessageLabel.text = constants.messageDefault
        errorMessageLabel.isHidden = true
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: dataView.bottomAnchor,
                                                   multiplier: constants.constraintTopErrorLabel),
            errorMessageLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: dataView.trailingAnchor)
        ])
    }
}
