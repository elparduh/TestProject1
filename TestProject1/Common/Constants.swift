import Foundation

// MARK: - Constants
struct Constants {
    // MARK: - Error
    var messageDefault: String { return "Error failure" }
    var titleServerError: String { return "Server Error" }
    var messageServerError: String { return "We could not process your request. Please try again.\nTap the button again" }
    var titleNetworkError: String { return "Network Error" }
    var messageNetworkError: String { return "Ensure you are connected to the internet. Please try again." }
    // MARK: - DataCardView
    var spacing: CGFloat { return 8.0 }
    var cornerRadius: CGFloat { return 5.0 }
    var constraintTop: CGFloat { return 1.0 }
    var constraintLeading: CGFloat { return 1.0 }
    var constraintTrailing: CGFloat { return 1.0 }
    var constraintBottom: CGFloat { return 1.0 }
    var constraintHeight: CGFloat { return 1.0 }
    // MARK: - UserGeneratorViewController
    var titleViewController: String { return "RandomUser" }
    var titleButton: String { return "Generate" }
    var imagePadding: CGFloat { return 8.0 }
    var constraintSafeArea: CGFloat { return 1.0 }
    var constraintDataView: CGFloat { return 1.0 }
    var constraintBottomButton: CGFloat { return 8.0 }
    var constraintHeightButton: CGFloat { return 48.0 }
    var constraintTopErrorLabel: CGFloat { return 2.0 }
    var animationValues: [Any] { return [0, 10, -10, 10, 0] }
    var animationTimes: [NSNumber] { return [0, 0.16, 0.5, 0.83, 1] }
    var animationDuration: CFTimeInterval { return 0.4 }
    var animationPosition: String { return "position.x" }
    var animationKey: String { return "shake" }
    var greetingOne: String { return "I'm" }
    var greetingTwo: String { return "I am" }
    var greetingThree: String { return "years old.\nI am from" }
    var greetingFour: String { return ".\nPlease call me at" }
    var greetingFive: String { return "or send me an email to" }
}
