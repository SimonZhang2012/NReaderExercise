//
//  PresenterTests.swift
//  NReaderExerciseTests
//
//  Created by Yixiang Zhang on 28/11/2022.
//

import XCTest
@testable import NReaderExercise

class MockView: ViewProtocol {
    
    var displayErrorExpectation: XCTestExpectation?
    func displayError(_ errorString: String) {
        displayErrorExpectation?.fulfill()
    }
    
    var presenterDidUpdateDataExpectation: XCTestExpectation?
    func updateView() {
        presenterDidUpdateDataExpectation?.fulfill()
    }
}



final class PresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testReadHardCodedData() {
        let interactor = Interactor()
        interactor.initialSetup()
        let presenter = Presenter(interactor: interactor)
        
        let view = MockView()
        presenter.view = view
        
        var assets = [asset]()
        assets.append(asset(id: 1,
                            categories: [],
                            authors: [],
                            url: "www.url1.com",
                            lastModified: 1000,
                            sponsored: true,
                            headline: "head line 1",
                            indexHeadline: "",
                            tabletHeadline: "",
                            theAbstract: "The abstract 1",
                            byLine: "byLine 1",
                            acceptComments: false,
                            numberOfComments: 0,
                            relatedImages: [],
                            timeStamp: 5000))
        assets.append(asset(id: 2,
                            categories: [],
                            authors: [],
                            url: "www.url2.com",
                            lastModified: 1000,
                            sponsored: true,
                            headline: "head line 2",
                            indexHeadline: "",
                            tabletHeadline: "",
                            theAbstract: "The abstract 2",
                            byLine: "byLine 2",
                            acceptComments: false,
                            numberOfComments: 0,
                            relatedImages: [],
                            timeStamp: 3000))
        assets.append(asset(id: 3,
                            categories: [],
                            authors: [],
                            url: "www.url3.com",
                            lastModified: 1000,
                            sponsored: true,
                            headline: "head line 3",
                            indexHeadline: "",
                            tabletHeadline: "",
                            theAbstract: "The abstract 3",
                            byLine: "byLine 3",
                            acceptComments: false,
                            numberOfComments: 0,
                            relatedImages: [],
                            timeStamp: 4000))
        let data = RepresentedObject(id: 1,
                                 categories: [],
                                 authors: [],
                                 url: "",
                                 lastModified: 100,
                                 onTime: 100,
                                 sponsored: false,
                                 displayName: "display name",
                                 assets: assets,
                                 relatedAssets: [],
                                 relatedImages: [],
                                 assetType: "type",
                                 timeStamp: 1000)
        
        let expectation = XCTestExpectation(description: "view update should be called")
        view.presenterDidUpdateDataExpectation = expectation
        
        presenter.interactorDidUpdateData(result: .success(data))
        
        // Veryfy updateView got called
        wait(for: [expectation], timeout: 0.1)
        
        // Verify Display objects are generated correctly
        let asset = presenter.displayAssets
        XCTAssertEqual(asset.count, 3)
        
        // They are sorted by timeStamp
        XCTAssertTrue(asset[0].timeStamp >= asset[1].timeStamp)
        XCTAssertTrue(asset[1].timeStamp >= asset[2].timeStamp)
        
        // More detailed value comprision could be added here
    }

    func testReadDataFailed() {
        enum myError: Error {
          case myTestError
        }
        
        let interactor = Interactor()
        interactor.initialSetup()
        let presenter = Presenter(interactor: interactor)
        
        let view = MockView()
        presenter.view = view
        
        let expectation = XCTestExpectation(description: "display error should be called")
        view.displayErrorExpectation = expectation
        
        presenter.interactorDidUpdateData(result: .failure(myError.myTestError))
        // Veryfy updateView got called
        wait(for: [expectation], timeout: 0.1)
        
        // We should not have assets to display
        XCTAssertTrue(presenter.displayAssets.isEmpty)
        
    }
    

}
