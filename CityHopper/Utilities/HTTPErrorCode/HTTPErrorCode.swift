//
//  HTTPErrorCode.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/9/22.
//

import Foundation

enum HTTPErrorCode: Error, CaseIterable {

  case httpOK
  case created
  case noContent
  case notModified
  case badRequest
  case unauthorized
  case forbidden
  case notFound
  case conflict
  case internalServerError
  case invalidURL
  case nonConfiguredCode
  case couldNotCreateURLResponse

  /// code
  var code: Int {
    switch self {
    case .httpOK:
      return 200
    case .created:
      return 201
    case .noContent:
      return 204
    case .notModified:
      return 304
    case .badRequest:
      return 400
    case .unauthorized:
      return 401
    case .forbidden:
      return 403
    case .notFound:
      return 404
    case .conflict:
      return 409
    case .internalServerError:
      return 500
    case .invalidURL:
      return 4000
    case .nonConfiguredCode:
      return 4001
    case .couldNotCreateURLResponse:
      return 4002
    }
  }

  /// message
  var message: String {
    switch self {
    case .httpOK:
      return "200 OK"
    case .created:
      return "201 Created"
    case .noContent:
      return "204 No Content"
    case .notModified:
      return "304 Not Modified"
    case .badRequest:
      return "400 Bad Request"
    case .unauthorized:
      return "401 Unauthorized"
    case .forbidden:
      return "403 Forbidden"
    case .notFound:
      return "404 Not Found"
    case .conflict:
      return "409 Conflict"
    case .internalServerError:
      return "500 Internal Server Error"
    case .invalidURL:
      return "4000 Invalid URL"
    case .nonConfiguredCode:
      return "4001 Non-configured Code"
    case .couldNotCreateURLResponse:
      return "4002 Could not create URLResponse"
    }
  }

  var isError: Bool {
    if self.code >= 300 {
      return true
    }
    return false
  }
}
