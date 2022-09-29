//
//  BuilderDelegate.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/25/22.
//

import Foundation

/// Protocol for the BuilderDelegate
public protocol TripBuilderDelegate: AnyObject {
  
  func buildTripWithPartialData(tripName: String, tripDate: Date, firstName: String, lastName: String)
}
