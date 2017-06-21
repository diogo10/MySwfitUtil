//
//  CreateAccountTests.swift
//
//  Created by Diogo on 20/06/2017.

import XCTest
@testable import Eureka

class NewCreateAccountViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        app = XCUIApplication();
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTryToCreateAccount1() {
        app.launch()
        app.buttons["SIGN UP"].tap();
        XCTAssert(app.staticTexts["General"].exists);
        app.tables.staticTexts["Yes I speak Irish"].tap();
        app.tables.staticTexts["Nap"].tap();
        app.swipeDown();
        app.swipeUp();
        
        let textField1 = app.textFields["Enter text here"]
        textField1.tap()
        textField1.typeText("joemasilotti")
        
        let textField2 = app.textFields["example@hotmail.com"]
        textField2.tap()
        textField2.typeText("joemasilotti@hotmail.com")
        
        app.swipeUp();
        
        let yesOptions = app.tables.staticTexts.matching(identifier: "Yes");
        
        if yesOptions.count > 0 {
            yesOptions.element(boundBy: 0).tap();
        }
        
        app.navigationBars.buttons["SUBMIT"].tap(); //SUBMIT BAR ITEM
        sleep(5);
    }
    
    
    
}
