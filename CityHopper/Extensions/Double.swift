//
//  Double.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/16/22.
//

import Foundation

extension Double {
  // rounds double to decimal places
  func rounded(toPlaces places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}
