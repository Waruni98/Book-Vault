//
//  BookvaultUITests.swift
//  BookvaultUITests
//
//  Created by waruni on 2023-06-18.
//

import XCTest

final class BookvaultUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
  
    }

   
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.otherElements["card:com.iosapp.Bookvault:sceneID:com.iosapp.Bookvault-9A596F54-2E93-461B-9B63-E9B0293716EA"].scrollViews/*[[".windows[\"SBSwitcherWindow:Main\"]",".otherElements[\"AppSwitcherContentView\"]",".otherElements[\"Bookvault\"].scrollViews",".otherElements[\"card:com.iosapp.Bookvault:sceneID:com.iosapp.Bookvault-9A596F54-2E93-461B-9B63-E9B0293716EA\"].scrollViews",".scrollViews"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,4],[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).swipeUp()
        app/*@START_MENU_TOKEN@*/.icons["Bookvault"]/*[[".otherElements[\"Home screen icons\"]",".icons.icons[\"Bookvault\"]",".icons[\"Bookvault\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Book Vault"]/*@START_MENU_TOKEN@*/.buttons["Add Book"]/*[[".otherElements[\"Add Book\"].buttons[\"Add Book\"]",".buttons[\"Add Book\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Name of Book"]/*[[".cells.textFields[\"Name of Book\"]",".textFields[\"Name of Book\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let authorSNameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Author's name"]/*[[".cells.textFields[\"Author's name\"]",".textFields[\"Author's name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        authorSNameTextField.tap()
        authorSNameTextField.tap()
        
        let textView = collectionViewsQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "Favorite").element(boundBy: 4).tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Genre, Fantasy"]/*[[".cells.buttons[\"Genre, Fantasy\"]",".buttons[\"Genre, Fantasy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
       
        app.alerts["Are you sure you want to save this book?"].scrollViews.otherElements.buttons["Save"].tap()
        
        let bookVaultNavigationBar = app.navigationBars["Book Vault"]
        bookVaultNavigationBar.searchFields["Search"].tap()
        
   
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["🤩, Harry Potter, Wilson"]/*[[".cells.buttons[\"🤩, Harry Potter, Wilson\"]",".buttons[\"🤩, Harry Potter, Wilson\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let app2 = app
        app2.navigationBars["Harry Potter"]/*@START_MENU_TOKEN@*/.buttons["Delete this book"]/*[[".otherElements[\"Delete this book\"].buttons[\"Delete this book\"]",".buttons[\"Delete this book\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Delete this? "].scrollViews.otherElements.buttons["Delete"].tap()
        bookVaultNavigationBar.buttons["Cancel"].tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["😇, TestBook1, Author1"]/*[[".cells.buttons[\"😇, TestBook1, Author1\"]",".buttons[\"😇, TestBook1, Author1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["TestBook1"].buttons["Book Vault"].tap()
        app2.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.buttons["Edit Book"]/*[[".otherElements[\"Edit Book\"].buttons[\"Edit Book\"]",".buttons[\"Edit Book\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Name of Book"]/*[[".cells.textFields[\"Name of Book\"]",".textFields[\"Name of Book\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Save"]/*[[".cells.buttons[\"Save\"]",".buttons[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
        

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
