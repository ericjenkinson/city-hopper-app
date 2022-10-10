//
//  State.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import Foundation

extension DataRetriever {
  enum State {
    case paused
    case downloading
    case failed
    case finished
    case waiting
  }
}
