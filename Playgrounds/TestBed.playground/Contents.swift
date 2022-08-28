import UIKit

var greeting = "Hello, playground"

// Assignment 1
struct City {
  let name: String
  let image: String
  let country: String
  let description: String
  let reviews: [Review]?  // Assignment 3
  let price: Double
}

// The following are not used in homework/week02 with the exception
// of Review as it is an element of City. There were ideas I had
// to build the data model
struct Person {
  let id: UUID
  let firstName: String
  let lastName: String
  let trips: [Trip]?
  let reviews: [Review]?
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

// Assignment 2
var cities = [City]()
