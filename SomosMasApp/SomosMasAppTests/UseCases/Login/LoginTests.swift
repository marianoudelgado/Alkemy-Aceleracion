//
//  LoginTests.swift
//  SomosMasAppTests
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import XCTest
@testable import SomosMasApp

class LoginTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailText() {
        //Given
        let emailWithoutAt = "rodrigohotmail.com"                                                   // Without @
        let emailWithoutDotCom = "rodrigo@hotmailcom"                                               // Without .com
        let emailWithSpace = "rodrigo @hotmail.com"                                                 // with space
        let emailWithSpecialCharacter = "rodrigo#@hotmail.com"                                      // with special characters
                                
        let emailWithNumberAndCharacter = "rodr1g0@hotmail.com"                                     // With numbers
        let emailLowerCase = "rodrigo@hotmail.com"                                                  // LowerCase
        let emailUpperCase = "RODRIGO@HOTMAIL.COM"                                                  // Upper case
        
        //When
        XCTAssertFalse(emailWithoutAt.isValidEmail)
        XCTAssertFalse(emailWithoutDotCom.isValidEmail)
        XCTAssertFalse(emailWithSpace.isValidEmail)
        XCTAssertFalse(emailWithSpecialCharacter.isValidEmail)
        
        XCTAssertTrue(emailWithNumberAndCharacter.isValidEmail)
        XCTAssertTrue(emailLowerCase.isValidEmail)
        XCTAssertTrue(emailUpperCase.isValidEmail)
    }
    
    func testPasswordText() {
        let passwordOnlyCharacters = "rodrigo"                                                      //Only Character - Quantity characters < 8
        let passwordOnlyCharacterEightCharacters = "rodrigotorres"                                  //Only Character - Quantity characters > 8
        let passwordCharacterAndNumber = "rodrigotorres10"                                          //Character and numbers - Quantity characters < 8
        let passwordCharacterAndNumberEightCharacters = "rodrigotorres10"                           //Character and numbers - Quantity characters < 8
        let passwordUpperCase = "RODRIGOTORRES10"                                                   // Uppercase
        
        XCTAssertFalse(passwordOnlyCharacters.isValidPassword)
        XCTAssertFalse(passwordOnlyCharacterEightCharacters.isValidPassword)
        XCTAssertTrue(passwordCharacterAndNumber.isValidPassword)
        XCTAssertTrue(passwordCharacterAndNumberEightCharacters.isValidPassword)
        XCTAssertTrue(passwordUpperCase.isValidPassword)
    }

}
