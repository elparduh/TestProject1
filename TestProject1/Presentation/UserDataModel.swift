import Foundation

class UserDataModel: ObservableObject {
    @Published var name: String = String()
    @Published var phone: String = String()
    @Published var email: String = String()
}
