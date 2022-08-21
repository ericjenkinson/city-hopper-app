//
//  Constants.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import Foundation
import UIKit

enum Constants {
  enum General {
    public static let strokeWidth = CGFloat(2.0)
    public static let roundedViewLength = CGFloat(56.0)
    public static let onboardingCloseButtonMaxWidth = CGFloat(300.0)
    public static let onboardingCloseButtonCornerRadius = CGFloat(24.0)
  }
  enum Color {
    public static let TextColor = "TextColor"
    public static let ButtonStrokeColor = "ButtonStrokeColor"
    public static let ButtonTextColor = "ButtonTextColor"
  }
  enum AppData {
    public static let appName = "City Hopper"
    public static let buttonSFSymbol = "folder"
    public static let welcomeMessage = "Welcome, "
    public static let userName = "Eric"
    public static let closeOnboarding = "Back to App"
  }
}
