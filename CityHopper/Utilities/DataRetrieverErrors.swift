//
//  DataRetrieverErrorCodes.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/21/22.
//

import Foundation

enum DataRetrieverErrors: Error {
  case errorSavingJSON
  case errorSavingPlist
  case errorSavingBinaryPlist
  case errorLoadingPlist
  case errorGettingData
  case errorGettingResponse
  case errorDecodingJSON
  case errorNoLocationsToPersist
  case errorInSaveBlock
  case errorWritingToCoreData
}
