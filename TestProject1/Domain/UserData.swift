import Foundation

public struct UserData {
  let firstName: String?
  let lastName: String?
  let houseNumber: Int?
  let streetName: String?
  let city: String?
  let state: String?
  let country: String?
  let email: String?
  let age: Int?
  let phone: String?
  let picture: String?
  
  public init(ramdomUserModel: RamdomUserModel? = nil) {
    self.firstName = ramdomUserModel?.results?.first?.name?.first
    self.lastName = ramdomUserModel?.results?.first?.name?.last
    self.houseNumber = ramdomUserModel?.results?.first?.location?.street?.number
    self.streetName = ramdomUserModel?.results?.first?.location?.street?.name
    self.city = ramdomUserModel?.results?.first?.location?.city
    self.state = ramdomUserModel?.results?.first?.location?.state
    self.country = ramdomUserModel?.results?.first?.location?.country
    self.email = ramdomUserModel?.results?.first?.email
    self.age = ramdomUserModel?.results?.first?.dob?.age
    self.phone = ramdomUserModel?.results?.first?.phone
    self.picture = ramdomUserModel?.results?.first?.picture?.large
  }
}
