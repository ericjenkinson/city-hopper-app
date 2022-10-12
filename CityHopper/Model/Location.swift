//
//  Location.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/12/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct Location: Codable {
  let results: [LocationResult]
  let more: Bool
  let isDeprecated: String
  
  enum CodingKeys: String, CodingKey {
    case results, more
    case isDeprecated = "is_deprecated"
  }
}

// MARK: - Result
struct LocationResult: Codable {
  let id: String
  let coordinates: Coordinates
  let score: Double
  let countryID: String
  let images: [LocationImage]
  let name: String
  let generatedIntro: String?
  let price = Int.random(in: 500..<2000)
  
  enum CodingKeys: String, CodingKey {
    case id, coordinates, score
    case countryID = "country_id"
    case images, name
    case generatedIntro = "generated_intro"
  }
}

// MARK: - Coordinates
struct Coordinates: Codable {
  let latitude, longitude: Double
}

// MARK: - Image
struct LocationImage: Codable {
  let sizes: Sizes
}

// MARK: - Sizes
struct Sizes: Codable {
  let medium, original, thumbnail: Medium
}

// MARK: - Medium
struct Medium: Codable {
  let url: String
  let bytes, width: Int
  let format: Format
  let height: Int
}

enum Format: String, Codable {
  case jpg = "jpg"
}
