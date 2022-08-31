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

// The following structs are not used in homework/week02 with the exception
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
  let rating: Double
  let description: String
}

// Assignment 2
var cities = [City]()

// Assignment 4
let city1 = City(name: "Munich", image: "pexels-aleksandr-unikovskiy-10505611-Munich.jpg", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)
let city2 = City(name: "Cairo", image: "pexels-alex-azabache-3290075-cairo.jpg", country: "Egypt", description: "Pyramids!!", reviews: [Review(id: UUID(), rating: 4.3, description: "Great!")], price: 1600.00)
let city3 = City(name: "Toronto", image: "pexels-alex-ohan-11675281-toronto.jpg", country: "Canada", description: "Maple Syrup", reviews: [Review(id: UUID(), rating: 3.3, description: "Great!")], price: 1000.00)
let city4 = City(name: "Florence", image: "pexels-alex-zhernovyi-3822486-florence.jpg", country: "Italy", description: "The Great Masters", reviews: [Review(id: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00)
let city5 = City(name: "Chicago", image: "pexels-cameron-casey-1334605-chicago.jpg", country: "United States", description: "The Great Masters", reviews: nil, price: 900.00)
let city6 = City(name: "Tokyo", image: "pexels-clyde-thomas-6602635-tokyo.jpg", country: "Japan", description: "Samurai", reviews: [Review(id: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00)

// Assignment 5
func add(city: City) {
  cities.append(city)
}

add(city: city1)
add(city: city2)
add(city: city3)
add(city: city4)
add(city: city5)
add(city: city6)

print(cities.count)

// Assignment 6
func printCompleteEntires(for cities: [City]) {
  for city in cities where city.reviews != nil {
    print("name: \(city.name), image: \(city.image), country: \(city.country), description: \(city.description), reviews: \(city.reviews!), price: \(city.price)")
  }
}

printCompleteEntires(for: cities)

// nice to have:
// Create more than one collection
// use a return statement

var cityReviews: [Review]?

func getReviews(for city: City) -> [Review]? {
  city.reviews ?? nil
}

cityReviews = getReviews(for: city2)

if cityReviews != nil {
  print("Reviews for \(city2.name) are: \(cityReviews!)")
} else {
  print("City: \(city2.name) has no reviews.")
}


// Assignment 7
// The structures for City and Review have been added to Model\City.swift and Model\Review.swift
// Model\Destination.swift is structure that has the methods.

// nice to have: Display the data in the iPhone simulator
// Code was added to HomeScreen.swift to display the city names in a scroll view.
