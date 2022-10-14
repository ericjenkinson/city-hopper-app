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

  var icon: String {
    switch self {
    case .beach:
      return "iconBeach"
    case .museums:
      return "iconMuseums"
    case .cultural:
      return "iconCultural"
    case .historical:
      return "iconHistorical"
    case .monuments:
      return "iconMonuments"
    case .festivals:
      return "iconFestivals"
    case .theaters:
      return "iconTheaters"
    case .themeParks:
      return "iconThemeParks"
    case .dining:
      return "iconDining"
    case .nightLife:
      return "iconNightLife"
    }
  }
}

extension Category: CaseIterable { }
