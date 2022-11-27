//
//  Collection+SafeAccessTests.swift
//  NReaderExerciseTests
//
//  Created by Yixiang Zhang on 28/11/2022.
//

import XCTest
@testable import NReaderExercise

final class Collection_SafeAccessTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAccessArraySafely() throws {
        let array : [Int] = [0, 1, 2, 3, 4, 5, 6]
        
        XCTAssertNil(array[safe: -100])
        XCTAssertNil(array[safe: -2])
        XCTAssertNil(array[safe: -1])
        XCTAssertNil(array[safe: 7])
        XCTAssertNil(array[safe: 8])
        XCTAssertNil(array[safe: 100])
        
        XCTAssertEqual(array[safe: 0], 0)
        XCTAssertEqual(array[safe: 1], 1)
        XCTAssertEqual(array[safe: 2], 2)
        XCTAssertEqual(array[safe: 3], 3)
        XCTAssertEqual(array[safe: 4], 4)
        XCTAssertEqual(array[safe: 5], 5)
        XCTAssertEqual(array[safe: 6], 6)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
