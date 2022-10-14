//
//  Cart.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/4/22.
//

import Foundation

enum DiscountType: Double, CaseIterable {
  case multiCity = 0.1
  case wedding = 0.2
  case holiday = 0.3
  case openingDay = 0.5
  case noDiscount = 0.0
}

struct Cart {
  var items: [String]?
  var itemPrices: [Double]?
  var discount = DiscountType.noDiscount

  init(loadTestData: Bool = false) {
    self.itemPrices = [1200.00, 1600.00, 1000.00, 2000.00, 900.00, 2400.00]
    self.discount = .multiCity
  }

  var currentDiscountedAmount: Double {
    guard itemPrices != nil else {
      return 0.0
    }
    let discountedItemPrices = itemPrices?.map { (price) -> Double in
      price * discount.rawValue
    }
    return (discountedItemPrices?.reduce(0, +))!
  }
}
