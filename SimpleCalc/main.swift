//
//  main.swift
//  SimpleCalc
//
//  Created by Trevor Allen on 4/4/16.
//  Copyright © 2016 Trevor Allen. All rights reserved.
//

import Foundation

var nums = [Float]()    // Store the values used in the operation
var result: Float?      // The result of the expression
var response: String?   // Used to read in input

// Combine function for reduce sum
func sum(accumulator: Float, current: Float) -> Float {
    return accumulator + current
}

// Checks if cli args were given
if (Process.arguments.count > 1) {
    var arg = 1
    
    // Iterate while the current value is a float
    while Float.init(Process.arguments[arg]) != nil {
        nums.append(Float.init(Process.arguments[arg])!)
        arg += 1
    }
    
    response = Process.arguments[arg]
} else {
    print("Enter an expression separated by returns:")
    
    response = readLine(stripNewline: true)!
    
    while Float.init(response!) != nil {
        nums.append(Float.init(response!)!)
        response = readLine(stripNewline: true)!
    }
}

// If at least 1 number was given
if (nums.count > 0) {
    switch response! {
    case "+":
        if (nums.count == 1) { // Exactly one number was given before + operation
            result = nums[0] + Float.init(readLine(stripNewline: true)!)!
        }
        break
    case "-":
        if (nums.count == 1) { // Exactly one number was given before - operation
            result = nums[0] - Float.init(readLine(stripNewline: true)!)!
        }
        break
    case "*":
        if (nums.count == 1) { // Exactly one number was given before * operation
            result = nums[0] * Float.init(readLine(stripNewline: true)!)!
        }
        break
    case "/":
        if (nums.count == 1) { // Exactly one number was given before / operation
            result = nums[0] / Float.init(readLine(stripNewline: true)!)!
        }
        break
    case "count":
        result = Float(nums.count)
        break
    case "avg":
        result = nums.reduce(0, combine: sum) / Float(nums.count)
        break
    case "fact":
        if (nums.count == 1) {  // Exactly one number was given to compute factorial
            result = 1
            if(result == 0 || nums[0] == 1) {
                result = 1
            } else {
                for i in 2...Int(nums[0]) {
                    result = result! * Float(i)
                }
            }
        }
        break
    default: // The operation given is not supported
        print("Invalid operation")
        break
    }
}

// If a result was calculated
if ((result) != nil) {
    print("Result: \(result!)")
} else {
    print("Invalid Expression")
}






