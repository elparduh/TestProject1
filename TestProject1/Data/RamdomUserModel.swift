import Foundation

public struct RamdomUserModel : Codable {
  let results : [Results]?
  let info : Info?

  enum CodingKeys: String, CodingKey {
    case results = "results"
    case info = "info"
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    results = try values.decodeIfPresent([Results].self, forKey: .results)
    info = try values.decodeIfPresent(Info.self, forKey: .info)
  }
}

struct Results : Codable {
  let gender : String?
  let name : Name?
  let location : Location?
  let email : String?
  let login : Login?
  let dob : Dob?
  let registered : Registered?
  let phone : String?
  let cell : String?
  let id : Id?
  let picture : Picture?
  let nat : String?

  enum CodingKeys: String, CodingKey {
    case gender = "gender"
    case name = "name"
    case location = "location"
    case email = "email"
    case login = "login"
    case dob = "dob"
    case registered = "registered"
    case phone = "phone"
    case cell = "cell"
    case id = "id"
    case picture = "picture"
    case nat = "nat"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    gender = try values.decodeIfPresent(String.self, forKey: .gender)
    name = try values.decodeIfPresent(Name.self, forKey: .name)
    location = try values.decodeIfPresent(Location.self, forKey: .location)
    email = try values.decodeIfPresent(String.self, forKey: .email)
    login = try values.decodeIfPresent(Login.self, forKey: .login)
    dob = try values.decodeIfPresent(Dob.self, forKey: .dob)
    registered = try values.decodeIfPresent(Registered.self, forKey: .registered)
    phone = try values.decodeIfPresent(String.self, forKey: .phone)
    cell = try values.decodeIfPresent(String.self, forKey: .cell)
    id = try values.decodeIfPresent(Id.self, forKey: .id)
    picture = try values.decodeIfPresent(Picture.self, forKey: .picture)
    nat = try values.decodeIfPresent(String.self, forKey: .nat)
  }
}

struct Info : Codable {
  let seed : String?
  let results : Int?
  let page : Int?
  let version : String?

  enum CodingKeys: String, CodingKey {
    case seed = "seed"
    case results = "results"
    case page = "page"
    case version = "version"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    seed = try values.decodeIfPresent(String.self, forKey: .seed)
    results = try values.decodeIfPresent(Int.self, forKey: .results)
    page = try values.decodeIfPresent(Int.self, forKey: .page)
    version = try values.decodeIfPresent(String.self, forKey: .version)
  }
}

struct Name : Codable {
  let title : String?
  let first : String?
  let last : String?

  enum CodingKeys: String, CodingKey {
    case title = "title"
    case first = "first"
    case last = "last"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    first = try values.decodeIfPresent(String.self, forKey: .first)
    last = try values.decodeIfPresent(String.self, forKey: .last)
  }
}

struct Location : Codable {
  let street : Street?
  let city : String?
  let state : String?
  let country : String?
  let postcode : Int?
  let coordinates : Coordinates?
  let timezone : Timezone?

  enum CodingKeys: String, CodingKey {
    case street = "street"
    case city = "city"
    case state = "state"
    case country = "country"
    case postcode = "postcode"
    case coordinates = "coordinates"
    case timezone = "timezone"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    street = try values.decodeIfPresent(Street.self, forKey: .street)
    city = try values.decodeIfPresent(String.self, forKey: .city)
    state = try values.decodeIfPresent(String.self, forKey: .state)
    country = try values.decodeIfPresent(String.self, forKey: .country)
    postcode = try values.decodeIfPresent(Int.self, forKey: .postcode)
    coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
    timezone = try values.decodeIfPresent(Timezone.self, forKey: .timezone)
  }
}

struct Login : Codable {
  let uuid : String?
  let username : String?
  let password : String?
  let salt : String?
  let md5 : String?
  let sha1 : String?
  let sha256 : String?

  enum CodingKeys: String, CodingKey {
    case uuid = "uuid"
    case username = "username"
    case password = "password"
    case salt = "salt"
    case md5 = "md5"
    case sha1 = "sha1"
    case sha256 = "sha256"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
    username = try values.decodeIfPresent(String.self, forKey: .username)
    password = try values.decodeIfPresent(String.self, forKey: .password)
    salt = try values.decodeIfPresent(String.self, forKey: .salt)
    md5 = try values.decodeIfPresent(String.self, forKey: .md5)
    sha1 = try values.decodeIfPresent(String.self, forKey: .sha1)
    sha256 = try values.decodeIfPresent(String.self, forKey: .sha256)
  }
}

struct Dob : Codable {
  let date : String?
  let age : Int?

  enum CodingKeys: String, CodingKey {
    case date = "date"
    case age = "age"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    date = try values.decodeIfPresent(String.self, forKey: .date)
    age = try values.decodeIfPresent(Int.self, forKey: .age)
  }
}

struct Registered : Codable {
  let date : String?
  let age : Int?

  enum CodingKeys: String, CodingKey {
    case date = "date"
    case age = "age"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    date = try values.decodeIfPresent(String.self, forKey: .date)
    age = try values.decodeIfPresent(Int.self, forKey: .age)
  }
}

struct Id : Codable {
  let name : String?
  let value : String?

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case value = "value"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    value = try values.decodeIfPresent(String.self, forKey: .value)
  }
}

struct Picture : Codable {
  let large : String?
  let medium : String?
  let thumbnail : String?

  enum CodingKeys: String, CodingKey {
    case large = "large"
    case medium = "medium"
    case thumbnail = "thumbnail"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    large = try values.decodeIfPresent(String.self, forKey: .large)
    medium = try values.decodeIfPresent(String.self, forKey: .medium)
    thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
  }
}

struct Street : Codable {
  let number : Int?
  let name : String?

  enum CodingKeys: String, CodingKey {
    case number = "number"
    case name = "name"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    number = try values.decodeIfPresent(Int.self, forKey: .number)
    name = try values.decodeIfPresent(String.self, forKey: .name)
  }
}

struct Coordinates : Codable {
  let latitude : String?
  let longitude : String?

  enum CodingKeys: String, CodingKey {
    case latitude = "latitude"
    case longitude = "longitude"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
    longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
  }
}

struct Timezone : Codable {
  let offset : String?
  let description : String?

  enum CodingKeys: String, CodingKey {
    case offset = "offset"
    case description = "description"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    offset = try values.decodeIfPresent(String.self, forKey: .offset)
    description = try values.decodeIfPresent(String.self, forKey: .description)
  }
}

