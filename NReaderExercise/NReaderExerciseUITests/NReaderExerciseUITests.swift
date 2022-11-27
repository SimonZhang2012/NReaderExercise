//
//  NReaderExerciseUITests.swift
//  NReaderExerciseUITests
//
//  Created by Yixiang Zhang on 23/11/2022.
//

import XCTest
import Foundation

final class NReaderExerciseUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppLaunchDefaultView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // We should see a collectionView
        XCTAssertTrue(app.collectionViews.element.exists)
        
        // The collectionView is not empty
        XCTAssertNotEqual(app.collectionViews.children(matching:.any).count, 0)
        
        // We are seeing some texts and images
        XCTAssertNotEqual(app.collectionViews.descendants(matching: .staticText).count, 0)
        XCTAssertNotEqual(app.collectionViews.descendants(matching: .image).count, 0)
    }
    
    func testNavigationTapArticleAndGoBack() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // We can tap the first three items in collectionView
        let numberToTest = min(3, app.collectionViews.children(matching:.any).count)
        for index in 0 ..< numberToTest {
            let cell = app.collectionViews.children(matching:.any).element(boundBy: index)
            if cell.exists {
                cell.tap()
                
                // We are seeing an in-app browser with done button
                XCTAssertFalse(app.collectionViews.element.exists)
                XCTAssertTrue(app.webViews.element.exists)
                XCTAssertTrue(app.buttons["Done"].exists)
                
                
                // Tap "Done button" to bring us back
                app.buttons["Done"].tap()
                XCTAssertTrue(app.collectionViews.element.exists)
                XCTAssertFalse(app.webViews.element.exists)
            }
        }
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
