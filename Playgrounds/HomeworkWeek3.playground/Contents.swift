import UIKit
import CoreText

/*:
  ## Properties/ Data/ Formulae student needs:
 - **itemPrices**: An array containing prices of 7 (or any number of) items.
 - **totalAmount**: Total amount of all items before applying discount. (A single value.)
 - **discountPercentage**: A percentage discount number. For example: 5%, 10%.
 - **discountType**: Type of discount to be applied on an item. Discount types could be Default discount (5%), Thanksgiving discount (10%), Christmas discount (15%), New year discount (20%).
 - **discountedAmount**: Amount after applying discount on totalAmount. Formula: totalAmount * 0.5 (if a discount of 5% is applied).
 - **totalAmountAfterDiscount**: *total Amount - discountedAmount*.
*/

/*:
  ## Assignment 1:  Function
  Create a function with 2 parameters: totalAmount and discountPercentage (5%, 10% and so on).
  Calculate the discountedAmount and subtract this from the totalAmount (using formulae above).
  Return the totalAmountAfterDiscount.
 
  Materials: [Programming in Swift: Functions & Types Lesson 2: Review Functions](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/2)
*/

func discountAmount(for totalAmount: Double, discountPercentage: Double) -> Double {
  let discountedAmount = totalAmount * discountPercentage
  let totalAmountAfterDiscount = totalAmount - discountedAmount
  return totalAmountAfterDiscount
}

print(discountAmount(for: 12.99, discountPercentage: 0.1))

/*:
  ## Assignment 2: Function
  Modify the function above to now take in a default discount percentage that will be applied by default to all.
  Hint: Use function overloading.
 
  Materials: [Programming in Swift: Functions & Types Lesson 4: Overloading](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/4)
*/

func discountAmount(for totalAmount: Double, discount: Double = 0.1) -> Double {
  let totalAmountAfterDiscount = discountAmount(for: totalAmount, discountPercentage: discount)
  return totalAmountAfterDiscount
}

print(discountAmount(for: 12.99, discountPercentage: 0.1))
print(discountAmount(for: 12.99, discount: 0.1))


/*:
 ## Assignment 3: typealias
 Create a typealias for a function type that takes in totalAmount and discount type as parameters. It
 returns the totalAmountAfterDiscount.
 
 Now create a printDiscount function to print the totalAmountAfterDiscount for all discount types. It takes
 function type (typealias) as a parameter:
 
 *Hint*: (Double, String) -> Double
 
 Material: [Programming in Swift: Functions & Types Lesson 7: Functions as Parameters](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/7)
 
 Typealias are mentioned some in the video.
*/

func discountAmount(for totalAmount: Double, discountType: String) -> Double {
  var discountPercentage: Double
  if discountType == "Multi City" {
    discountPercentage = 0.1
  } else if discountType == "Wedding" {
    discountPercentage = 0.2
  } else if discountType == "Holiday" {
    discountPercentage = 0.3
  } else if discountType == "Opening Day" {
    discountPercentage = 0.5
  } else {
    discountPercentage = 0
  }
  return discountAmount(for: totalAmount, discount: discountPercentage)
}

typealias AmountAfterDiscount = (Double, String) -> Double

func printDiscount(_ amountAfterDiscount: AmountAfterDiscount, totalAmount: Double, discountType: String) {
  print(amountAfterDiscount(totalAmount, discountType))
}

printDiscount(discountAmount, totalAmount: 12.99, discountType: "Multi City")
printDiscount(discountAmount, totalAmount: 12.00, discountType: "Opening Day")
printDiscount(discountAmount, totalAmount: 12.00, discountType: "Does not exist")

/*:
 ## Assignment 4: Closure
 Create a closure that calculates the discount. Closures takes parameters as: total amount, discount type and
 subtracts discounted amount from total amount and prints the total amount after discount.

 Materials: [Programming in Swift: Functions & Types Lesson 10: Closures](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/10)\
   &emsp;&emsp;&emsp;&emsp;&ensp; [Programming in Swift: Functions & Types Lesson 12: Closures Syntax](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/12)
*/

let discountAmountLong = { (totalAmount: Double, discountType: String) -> Double in
  discountAmount(for: totalAmount, discountType: discountType)
}

/*:
 ### Nice to have
 Showcase the progression of the usage of a closure from the longest syntax to the shortest possible syntax.
 Longest syntax appears above in Assignment 4, the other three are below.
*/

let discountAmountNoParamTypes: AmountAfterDiscount = { (totalAmount, discountType) -> Double in
  discountAmount(for: totalAmount, discountType: discountType)
}

let discountAmountNoReturnType: AmountAfterDiscount = { (totalAmount, discountType)  in
  discountAmount(for: totalAmount, discountType: discountType)
}

let discountAmountShort: AmountAfterDiscount = { discountAmount(for: $0, discountType: $1) }

print(discountAmountLong(12.99, "Multi City"))
print(discountAmountNoParamTypes(12.99, "Multi City"))
print(discountAmountNoReturnType(12.99, "Multi City"))
print(discountAmountShort(12.99, "Multi City"))

/*:
 ## Assignment 5: Map
 Take itemPrices. Let’s say the prices of all of these items are to be increased by 50%.
 Multiply each element in an array with 0.5. Print the new item price.

 *Hint*: Use Array's map method.
 
 Materials: [Programming in Swift: Functions & Types Lesson 14: forEach & Map](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/14)
*/

let itemPrices = [10.99, 4.39, 199.49, 5.00, 212.75, 49.99, 99.99]
let increasedItemPrices = itemPrices.map { (price) -> Double in
  price + (price * 0.5)
}
print(itemPrices)
print(increasedItemPrices)

/*:
 ## Assignment 6: Sorted
 Create a (Discount types) dictionary (with discount type and percentage amount). Sort this dictionary from
 highest discount to lowest discount.
 
 *Hint*: Use Dictionary's **sorted**

 Materials: [Programming in Swift: Fundamentals 28: Creating and populating Dictionaries](https://www.raywenderlich.com/28092971-programming-in-swift-fundamentals/lessons/28)  \
 &emsp;&emsp;&emsp;&emsp;&ensp; [Programming in Swift: Functions & Types Lesson 12: Closures Syntax](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/17) \
 Note that the second video talks about sorted on array not dictionary, but both are collections.
*/

let discountTypes = ["Multi City": 0.1, "Wedding": 0.2, "Holiday": 0.3, "Opening Day": 0.5]
let sortedDiscountTypes = discountTypes.sorted{ $0.value > $1.value }
print(discountTypes)
print(sortedDiscountTypes)

/*:
 ## Assignment 7: Enums and Switch cases
 Use enums for discount types.
 Create a function printDiscount to print the value for discount types. Use switch cases and enums to do this.

 Materials: [Programming in Swift: Functions & Types Lesson 21: Enumerations](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/21) \
 &emsp;&emsp;&emsp;&emsp;&ensp; [Programming in Swift: Functions & Types Lesson 23: Switch Statements](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/23) \
 &emsp;&emsp;&emsp;&emsp;&ensp; [Programming in Swift: Functions & Types Lesson 24: More Switch Statements](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/24)
 */

enum DiscountType: Double, CaseIterable {
  case multiCity = 0.1
  case wedding = 0.2
  case holiday = 0.3
  case openingDay = 0.5
  case noDiscount = 0.0
}

func printDiscount(for discountType: DiscountType) {
  switch discountType {
  case .multiCity, .wedding, .holiday, .openingDay, .noDiscount:
    print(discountType.rawValue)
  }
}

let openingDiscount = DiscountType.openingDay
printDiscount(for: openingDiscount)

/*:
 ## Assignment 8: Computed property
 Create a computed property: currentDiscountedAmount that returns the current discounted amount that
 you apply on the itemPrices.
 
 Materials: [Programming in Swift: Functions & Types Lesson 30: Computed Properties](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/30) \
 &emsp;&emsp;&emsp;&emsp;&ensp; [Programming in Swift: Functions & Types Lesson 35: Computed Properties or Methods](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/35)
*/

struct ShoppingCart {
  var items: [String]?
  var itemPrices: [Double]?
  var discount = DiscountType.noDiscount
  
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

var usersCart = ShoppingCart()
print(usersCart.currentDiscountedAmount) // no prices, discount set DiscountType.noDiscount
usersCart.itemPrices = [10.99, 4.39, 199.49, 5.00, 212.75, 49.99, 99.99]
usersCart.discount = DiscountType.openingDay
print(usersCart.currentDiscountedAmount)

/*:
 ## Assignment 9: Lazy property
 Create a lazy property that returns the maximum discount that can be applied.

 Materials: [Programming in Swift: Functions & Types Lesson 31: Lazy Properties](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/31)
*/

func highestDiscount() -> Double {
  var max = 0.0
  for discount in DiscountType.allCases {  // Discount type was defined in Assignment 7 and is CaseIterable
    if discount.rawValue > max {
      max = discount.rawValue
    }
  }
  return max
}

struct LazyDiscount {
  lazy var maxDiscount = highestDiscount()
}

var lazyDiscount = LazyDiscount()
print(lazyDiscount.maxDiscount)

/*:
 ## Assignment 10: Method
 Create a method that calculates and returns totalAmountAfterApplyingDiscount.
 
 Hint: Method belongs to a class/ struct/ enum.
 
 Materials: [Programming in Swift: Functions & Types Lesson 33: Methods](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/33)

*/

extension ShoppingCart {
  func totalAmountAfterApplyingDiscount() {
    self.currentDiscountedAmount
  }
}

/*:
 ## Assignment 11: Protocol
 Create a protocol and class conforming to the protocol. For example: Discount that has DiscountType and
 DiscountPercentage and a method to calculate discount.
 
 Materials: [Programming in Swift: Functions & Types Lesson 42: Protocols](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/42)
            
*/

protocol Discount {
  var discountType: DiscountType { get set }
  var discountPercentage: Double { get set }
  
  func calculateDiscount() -> Double
}

class Price: Discount {
  var price: Double
  var discountType: DiscountType
  var discountPercentage = 0.0
  
  init(price: Double, discountType: DiscountType) {
    self.price = price
    self.discountType = discountType
    self.discountPercentage = self.discountType.rawValue
  }
  
  func calculateDiscount() -> Double {
    self.price * self.discountPercentage
  }
}

var itemPrice = Price(price: 12.99, discountType: DiscountType.multiCity)
print(itemPrice.calculateDiscount())

/*:
 ## Assignment 12: Extension
 Create an extension that rounds off the totalDiscountedAmount.
 
 Materials: [Programming in Swift: Functions & Types Lesson 43: Protocols & Extensions](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/43)
*/

struct PriceWithDiscountApplied {
  var totalDiscountedAmount = 30.018
}

extension PriceWithDiscountApplied {
  func totalDiscountAmountRounded() -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 0
    
    let fractionalPart = totalDiscountedAmount.truncatingRemainder(dividingBy: 1)
    if(fractionalPart >= 0.50) {
      formatter.roundingMode = .up
    } else {
      formatter.roundingMode = .down
    }
    return formatter.string(for: totalDiscountedAmount) ?? "0.00"
  }
}

var unrounded = PriceWithDiscountApplied()
print(unrounded.totalDiscountAmountRounded())
unrounded.totalDiscountedAmount = 50.6
print(unrounded.totalDiscountAmountRounded())

/*:
 ## Assignment 13: Final code goes in the app
 The code that best fits in the app goes to where it belongs. :]

 ### Code used in the app is found in model/cart.swift
 - enum DiscountType
 - enum ShoppingCart - renamed Cart
 
 In the UI there is text field that prints the total price with discount applied
 
*/


/*:
 ### Nice to have
 Display a date or a string (preferably a long string)  in a nice readable format using NSAttributedString.
 Use your creativity and make the date/string look appealing using different fonts/ colors.

 Material: [Swift Apprentice Chapter 20: Result Builders](https://www.raywenderlich.com/books/swift-apprentice/v7.0/chapters/20-result-builders)
*/



enum SpecialCharacters {
  case lineBreak
  case tab
  case comma
  case space
}

@resultBuilder
enum AttributedStringBuilder {
  
  static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
    let attributedString = NSMutableAttributedString()
    for component in components {
      attributedString.append(component)
    }
    return attributedString
  }
  // to allow if statements in the result builder
  static func buildOptional(_ component: NSAttributedString?) -> NSAttributedString {
    component ?? NSAttributedString()
  }
  
  // to allow if else statements in the result builder
  static func buildEither(first component: NSAttributedString) -> NSAttributedString {
    component
  }
  
  static func buildEither(second component: NSAttributedString) -> NSAttributedString {
    component
  }
  
  // to allow for-in loops
  static func buildArray(_ components: [NSAttributedString]) -> NSAttributedString {
    let attributedString = NSMutableAttributedString()
    for component in components {
      attributedString.append(component)
    }
    return attributedString
  }
  
  static func buildExpression(_ expression: SpecialCharacters) -> NSAttributedString {
    switch expression {
    case .lineBreak:
      return Text("\n")
    case .tab:
      return Text("\t")
    case .comma:
      return Text(",")
    case .space:
      return Text(" ")
    }
  }
  
  static func buildExpression(_ expression: NSAttributedString) -> NSAttributedString {
    expression
  }
  
}

extension NSMutableAttributedString {
  
  convenience init(_ string: String) {
    self.init(string: string)
  }
  
  public func color(_ color: UIColor) -> NSMutableAttributedString {
    self.addAttribute(NSMutableAttributedString.Key.foregroundColor,
                      value: color,
                      range: NSRange(location: 0, length: self.length))
    return self
  }
  
  public func font(_ font: UIFont) -> NSMutableAttributedString {
    self.addAttribute(NSAttributedString.Key.font,
                      value: font,
                      range: NSRange(location: 0, length: self.length))
    return self
  }
}

typealias Text = NSMutableAttributedString

@AttributedStringBuilder
func dateBuilder(stringArray: [String]) -> NSAttributedString {
  if !stringArray.isEmpty {
    for textItem in stringArray {
      Text(textItem)
        .font(.systemFont(ofSize: 20))
        .color(.red)
      SpecialCharacters.space
    }
  } else {
    Text(", No title")
  }
}

func longDate() {
  var textArray = [String]()
  let date = Date()
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "EEEE" // Weekday Name
  textArray.append("Today is \(dateFormatter.string(from: date))")
  dateFormatter.dateFormat = "LLLL" // month
  textArray.append(dateFormatter.string(from: date))
  dateBuilder(stringArray: textArray)
  let calendar = Calendar.current
  let components = calendar.dateComponents([.day], from: date)
  textArray.append(String(components.day!))
  dateFormatter.dateFormat = "yyyy"
  textArray.append(dateFormatter.string(from: date))
  
  dateBuilder(stringArray: textArray)
}

longDate()


