import UIKit

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

// Nice to have

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
 
 Materials: [[Programming in Swift: Functions & Types Lesson 14: forEach & Map]]https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/14
*/

let itemPrices = [10.99, 4.39, 199.49, 5.00]
let discountedItemPrices = itemPrices.map { (price) -> Double in
  price * 0.5
}
print(itemPrices)
print(discountedItemPrices)

/*:
 ## Assignment 6: Sorted
 Create a (Discount types) dictionary (with discount type and percentage amount). Sort this dictionary from
 highest discount to lowest discount.
 
 *Hint*: Use Dictionary's **sorted**

 Materials: [Programming in Swift: Fundamentals 28: Creating and populating Dictionaries](https://www.raywenderlich.com/28092971-programming-in-swift-fundamentals/lessons/28)  \
 &emsp;&emsp;&emsp;&emsp;&ensp; [Programming in Swift: Functions & Types Lesson 12: Closures Syntax](https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/17) \
 Note that the second video talks about sorted on array not dictionary, but both are collections.
*/

let DiscountTypes = ["Multi City": 0.1, "Wedding": 0.2, "Holiday": 0.3, "Opening Day": 0.5]

/*
 Assignment 7: Enums and Switch cases
 Use enums for discount types.
 Create a function printDiscount to print the value for discount types. Use switch cases and enums to do this.

 Materials: https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/21
            https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/23
            https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/24
 */

/*
 Assignment 8: Computed property
 Create a computed property: currentDiscountedAmount that returns the current discounted amount that
 you apply on the itemPrices.
 
 Materials: https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/30
            https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/35
*/

/*
 Assignment 9: Lazy property
 Create a lazy property that returns the maximum discount that can be applied.

 Materials: https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/31
*/

/*
 Assignment 10: Method
 Create a method that calculates and returns totalAmountAfterApplyingDiscount.
 
 Hint: Method belongs to a class/ struct/ enum.
 
 Materials: https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/33

*/

/*
 Assignment 11: Protocol
 Create a protocol and class conforming to the protocol. For example: Discount that has DiscountType and
 DiscountPercentage and a method to calculate discount.
 
 Materials: https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/42
            
*/

/*
 Assignment 12: Extension
 Create an extension that rounds off the totalDiscountedAmount.
 
 Materials: https://www.raywenderlich.com/28433240-programming-in-swift-functions-types/lessons/43
*/
