//
//  State.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import Foundation

extension DataDownloader {
  enum State {
    case paused
    case downloading
    case failed
    case finished
    case waiting
  }
}
