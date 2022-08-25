import UIKit

var greeting = "Hello, playground"


struct City {
  let name: String
  let image: String
  let country: String
  let description: String
  let reviews: [Review]?
  let price: Double
}

struct Person {
  let id: UUID
  let firstName: String
  let lastName: String
  let trips: [Trip]?
}

struct Group {
  let id: UUID
  let owner: Person
  let members: [Person]?
}

struct Trip {
  let id: UUID
  let name: String
  let owner: Person
  let cities: [City]?
  let group: [Group]?
}

struct Review {
  let id: UUID
  let rating: Int
  let description: String?
}
