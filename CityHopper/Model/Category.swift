//
//  Category.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//
import SwiftUI

enum Category {
  case beach
  case museums
  case cultural
  case historical
  case monuments
  case festivals
  case theaters
  case themeParks
  case dining
  case nightLife
  
  var name: String {
    switch self {
    case .beach:
      return "Beach"
    case .museums:
      return "Museums"
    case .cultural:
      return "Cultural"
    case .historical:
      return "Historical"
    case .monuments:
      return "Monuments"
    case .festivals:
      return "Festivals"
    case .theaters:
      return "Theaters"
    case .themeParks:
      return "Theme Parks"
    case .dining:
      return "Dining"
    case .nightLife:
      return "Night Life"
    }
  }
  
  var icon: Image {
    switch self {
    case .beach:
      return Image(systemName: "imageBeach")
    case .museums:
      return Image(systemName: "imageMuseums")
    case .cultural:
      return Image(systemName: "imageCultural")
    case .historical:
      return Image(systemName: "imageHistorical")
    case .monuments:
      return Image(systemName: "imageMonuments")
    case .festivals:
      return Image(systemName: "imageFestivals")
    case .theaters:
      return Image(systemName: "imageTheaters")
    case .themeParks:
      return Image(systemName: "imageThemeParks")
    case .dining:
      return Image(systemName: "imageDining")
    case .nightLife:
      return Image(systemName: "imageNightLife")
    }
  }
}

extension Category: CaseIterable { }
