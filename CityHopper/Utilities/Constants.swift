//
//  Constants.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import Foundation
import UIKit
import SwiftUI

enum Constants {
  enum General {
    public static let strokeWidth = CGFloat(2.0)
    public static let roundedViewLength = CGFloat(56.0)
    public static let onboardingCloseButtonMaxWidth = CGFloat(300.0)
    public static let onboardingCloseButtonCornerRadius = CGFloat(24.0)
    public static let unorderedListTextKerning = CGFloat(1.5)
    public static let samplePortraitViewHeight = CGFloat(320.0)
    public static let samplePortraitViewWidth = CGFloat(568.0)
  }
  enum Colors {
    public static let TextColor = Color("TextColor")
    public static let ButtonStrokeColor = Color("ButtonStrokeColor")
    public static let ButtonTextColor = Color("ButtonTextColor")
  }
  enum AppData {
    public static let appName = "City Hopper"
    public static let buttonSFSymbol = "folder"
    public static let welcomeMessage = "Welcome, "
    public static let userName = "Eric"
    public static let closeOnboarding = "Back to App"
    public static let obBodyLine1 = "Select cities to visit"
    public static let obBodyLine2 = "Plan trips across multiple cities."
    public static let obBodyLine3 = "Split the cost among the group."
    public static let obBodyLine4 = "Share your trip with others."
    
  }
  enum SFSymbols {
    public static let walking = "figure.walk"
    public static let airplane = "airplane"
    public static let group = "person.3"
    public static let camera = "camera"
  }
}
