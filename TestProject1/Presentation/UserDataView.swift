import SwiftUI

struct UserDataView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("User data").font(.title)
            Image("user")
                .resizable()
                .frame(width: 150, height: 150)
            Text("Name")
            Text("Phone")
            Text("E-mail")
        }.background(Color.teal)
    }
}

#Preview {
    UserDataView()
}
