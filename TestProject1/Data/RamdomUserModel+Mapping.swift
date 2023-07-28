import Foundation

extension RamdomUserModel {
    
    func toDomain() -> UserData {
        UserData(firstName: results?.first?.name?.first,
                 lastName: results?.first?.name?.last,
                 houseNumber: results?.first?.location?.street?.number,
                 streetName: results?.first?.location?.street?.name,
                 city: results?.first?.location?.city,
                 state: results?.first?.location?.state,
                 country: results?.first?.location?.country,
                 email: results?.first?.email,
                 age: results?.first?.dob?.age,
                 phone: results?.first?.phone,
                 picture: results?.first?.picture?.large)
    }
}
