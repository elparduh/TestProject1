import Foundation

// MARK: - Constants
struct Constants {
    // MARK: - Error
    var messageDefault: String { "Error failure" }
    var titleServerError: String { "Server Error" }
    var messageServerError: String { "We could not process your request. Please try again.\nTap the button again" }
    var titleNetworkError: String { "Network Error" }
    var messageNetworkError: String { "Ensure you are connected to the internet. Please try again." }
    // MARK: - DataCardView
    var spacing: CGFloat { 8.0 }
    var cornerRadius: CGFloat { 5.0 }
    var constraintTop: CGFloat { 1.0 }
    var constraintLeading: CGFloat { 1.0 }
    var constraintTrailing: CGFloat { 1.0 }
    var constraintBottom: CGFloat { 1.0 }
    var constraintHeight: CGFloat { 1.0 }
    // MARK: - UserGeneratorViewController
    var titleViewController: String { "RandomUser" }
    var titleButton: String { "Generate" }
    var imagePadding: CGFloat { 8.0 }
    var constraintSafeArea: CGFloat { 1.0 }
    var constraintDataView: CGFloat { 1.0 }
    var constraintBottomButton: CGFloat { 8.0 }
    var constraintHeightButton: CGFloat { 48.0 }
    var constraintTopErrorLabel: CGFloat { 2.0 }
    var animationValues: [Any] { [0, 10, -10, 10, 0] }
    var animationTimes: [NSNumber] { [0, 0.16, 0.5, 0.83, 1] }
    var animationDuration: CFTimeInterval { 0.4 }
    var animationPosition: String { "position.x" }
    var animationKey: String { "shake" }
    var greetingOne: String { "I'm" }
    var greetingTwo: String { "I am" }
    var greetingThree: String { "years old.\nI am from" }
    var greetingFour: String { ".\nPlease call me at" }
    var greetingFive: String { "or send me an email to" }
}
