//
//  AccountSummaryViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by Dishant Nagpal on 03/12/23.
//

import Foundation
import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
        // vc.loadViewIfNeeded()
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleMessage = vc.titleAndMessageForTesting(error: .serverError)
        XCTAssertEqual(titleMessage.0, "Server Error")
        XCTAssertEqual(titleMessage.1, "Ensure you are connected to the internet. Please try again.")
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(error: .decodingError)
        XCTAssertEqual(titleAndMessage.0, "Decoding Error")
        XCTAssertEqual(titleAndMessage.1, "We could not process your request. Please try again.")
    }
}
