//
//  ResumeAppUITests.swift
//  ResumeAppUITests

import XCTest

class ResumeAppUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testProfileImageViewExists() {
        let profileImage = app.images["profileImage"]
        XCTAssertTrue(profileImage.exists)
    }
    
    func testProfileBackgroundImageViewExists() {
        XCTAssertTrue(app.images["background"].exists)
    }
    
    func testProfileNameLabelExists() {
        XCTAssertTrue(app.staticTexts["name"].exists)
    }
    
    func testSectionsCollectionViewExists() {
        XCTAssertTrue(app.collectionViews.firstMatch.exists)
    }
    
    func testSectionsCollectionSwipesAllSections() {
        let sectionsCollectionView = app.collectionViews.firstMatch
        let cell = sectionsCollectionView.cells.firstMatch
        XCTAssertTrue(app.staticTexts["About"].exists)
        cell.swipeLeft()
        XCTAssertTrue(app.staticTexts["Experience"].exists)
        cell.swipeLeft()
        XCTAssertTrue(app.staticTexts["Skills"].exists)
        cell.swipeLeft()
        XCTAssertTrue(app.staticTexts["Information"].exists)
    }
}
