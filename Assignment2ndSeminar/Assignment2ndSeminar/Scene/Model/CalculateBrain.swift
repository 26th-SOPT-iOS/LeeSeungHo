//
//  CalculateBrain.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

class CalculateBrain {
    
    //MARK:- 변수 선언
    private var accumulator = 0.0
    private var internalProgram = [AnyObject]()
    
    func setOperand(operand: Double) {
        accumulator = operand
        internalProgram.append(operand as AnyObject)
    }
    
    //MARK:- 연산 선언
    
    private enum Operation {
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
        case clear
    }
    
    private var Operations: Dictionary <String, Operation> = [
        "×" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "=" : Operation.Equals,
        "C" : Operation.clear
    ]
    
    func performOperation(symbol: String) {
        internalProgram.append(symbol as AnyObject)
        
        if let operation = Operations[symbol] {
            switch operation {
            case .UnaryOperation(let functional) :
                accumulator = functional(accumulator)
            case .BinaryOperation(let functional2) :
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: functional2, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            case .clear:
                clear()
            }
        }
    }
    private var pending: PendingBinaryOperationInfo?
    private func executePendingBinaryOperation() {
      
        // 그냥 firstOperand나 상수로 배달해주면 안되나,,,,
        
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    
    //MARK:- TypeAlias, AnyObject 사용해보기(사용하지 말기를 권장)
    
    typealias Propertylist = AnyObject
    var program: Propertylist {
        get {
            return internalProgram as CalculateBrain.Propertylist
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject] {
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOperand(operand: operand)
                    } else if let operation = op as? String {
                        performOperation(symbol: operation)
                    }
                }
            }
        }
    }
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func clear() {
        print("clear")
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    
}
