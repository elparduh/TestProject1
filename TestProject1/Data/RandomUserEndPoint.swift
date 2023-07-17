import Foundation

enum RamdomUserEndPoint {
    case getUser
}

extension RamdomUserEndPoint : Endpoint {
    
    var path: String { "/" }
    var method: HTTPMethodType { .get }
}
