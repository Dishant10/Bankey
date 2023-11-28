//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Dishant Nagpal on 18/11/23.
//

import Foundation
import XCTest

@testable import Bankey

class Test : XCTestCase {
    
    var formatter : CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
        
    }
    
    func testBreakDollarsIntoCents() throws {
        
        let result = formatter.breakIntoDollarsAndCents(928474.683)
        XCTAssertEqual(result.0, " 9,28,474")
        XCTAssertEqual(result.1, "68")
        
    }
    
//    func testDollarsFormatter() throws {
//        let locale = Locale.current
//        let currencySymbol = locale.currencySymbol
//        
//        let result = formatter.dollarsFormatted(928474.683)
//        XCTAssertEqual(result, "\(currencySymbol!) 9,28,474.68")
//    }
     
    func testZeroDollarsFormatted(){
        
    }
    
}

