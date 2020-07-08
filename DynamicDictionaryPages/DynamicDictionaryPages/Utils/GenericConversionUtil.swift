//
//  GenericConversionUtil.swift
//  DynamicDictionaryPages
//
//  Created by Dona Thomas on 08/07/20.
//  Copyright © 2020 Dona Thomas. All rights reserved.
//

import Foundation

protocol Numeric:Comparable {
    //
    init(_ v:Float)
    init(_ v:Double)
    init(_ v:Int)
    init(_ v:UInt)
    init(_ v:Int8)
    init(_ v:UInt8)
    init(_ v:Int16)
    init(_ v:UInt16)
    init(_ v:Int32)
    init(_ v:UInt32)
    init(_ v:Int64)
    init(_ v:UInt64)
    init(_ v:Float80)
}

extension NSNumber {
    func convert<T: Numeric>() -> T {
        switch self {
        case let x as Float80:
            return T(x) //T.init(x)
        case let x as Float:
            return T(x)
        case let x as Double:
            return T(x)
        case let x as Int:
            return T(x)
        case let x as UInt:
            return T(x)
        case let x as Int8:
            return T(x)
        case let x as UInt8:
            return T(x)
        case let x as Int16:
            return T(x)
        case let x as UInt16:
            return T(x)
        case let x as Int32:
            return T(x)
        case let x as UInt32:
            return T(x)
        case let x as Int64:
            return T(x)
        case let x as UInt64:
            return T(x)
        default:
            assert(false, "Numeric convert cast failed!")
            return T(0)
        }
    }
}

extension Int{
    public  init(_ value: Int){
        self = value
    }
}
