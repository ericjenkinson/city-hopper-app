//
//  Category.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//

enum Category: String {
  case museums = "Museums"
  case cultural = "Cultural"
  case historical = "Historical"
  case monuments = "Monuments"
  case festivals = "Festivals"
  case theaters = "Theaters"
  case themeParks = "ThemeParks"
  case gastronomy = "Gastronomy"
  case nightLife = "Night Life"
}

extension Category: CaseIterable {
  
}
