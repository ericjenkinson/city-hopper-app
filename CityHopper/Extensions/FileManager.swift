//
//  FileManager.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/12/22.
//

import Foundation

public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
