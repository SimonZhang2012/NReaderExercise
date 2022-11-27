//
//  InteractorTests.swift
//  NReaderExerciseTests
//
//  Created by Yixiang Zhang on 28/11/2022.
//

import XCTest
@testable import NReaderExercise

class MockPresenter: PresenterProtocol {
    var interactorDidUpdateDataExpectation: XCTestExpectation?
    func interactorDidUpdateData(result: Result<NReaderExercise.RepresentedObject, Error>) {
        interactorDidUpdateDataExpectation?.fulfill()
    }
}

final class InteractorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreatingEmptyInteractor() throws {
        let interactor = Interactor()
        XCTAssertNil(interactor.data)
    }
    
    func testInitialSetup() {
        let interactor = Interactor()
        let presenter = MockPresenter()
        interactor.presenter = presenter
        
        // Verify we will call presenter to update data
        let expectation = XCTestExpectation(description: "interactor.initialSetup")
        presenter.interactorDidUpdateDataExpectation = expectation
        interactor.initialSetup()
        wait(for: [expectation], timeout: 10.0)
        
        // Receive some data
        XCTAssertNotNil(interactor.data)
    }

}
