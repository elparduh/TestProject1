import SwiftUI

struct UserDataView: View {
    @ObservedObject var userDataModel: UserDataModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text("User data in SwiftUI").font(.title)
            Image("user")
                .resizable()
                .frame(width: 150, height: 150)
            Text(userDataModel.name)
            Text(userDataModel.phone)
            Text(userDataModel.email)
        }
    }
}

#Preview {
    UserDataView(userDataModel: UserDataModel())
}
