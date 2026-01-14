//
//  ExampleInteractorTests.swift
//  UnitTests
//
//  Created by Yani . on 13/01/26.
//

import XCTest
@testable import ViperWithUnitTest

final class ExampleInteractorTests: XCTestCase {
    func test_fetchTitle_success_callsOutput() {
        let service = MockTitleService(result: .success("OK"))
        let interactor = ExampleInteractor(service: service)
        let output = MockOutput()

        interactor.output = output

        interactor.fetchTitle()

        XCTAssertEqual(output.titles, ["OK"])
        XCTAssertEqual(output.errorCounts, 0)
    }

    func test_fetchTitle_failed_callsOutput() {
        let service = MockTitleService(result: .failure(ServiceError.unknownError))
        let interactor = ExampleInteractor(service: service)
        let output = MockOutput()

        interactor.output = output

        interactor.fetchTitle()

        XCTAssertEqual(output.titles, [])
        XCTAssertEqual(output.errorCounts, 1)
    }
}

//MARK: - Mocks
private final class MockTitleService: TitleService {
    let result: Result<String, Error>

    init(result: Result<String, Error>) {
        self.result = result
    }

    func getTitle(completion: @escaping (Result<String, any Error>) -> Void) {
        completion(result)
    }
}

private final class MockOutput: ExampleInteractorOutputProtocol {
    var titles: [String] = []
    var errorCounts: Int = 0

    func didFetchTitle(_ title: String) {
        titles.append(title)
    }
    
    func didFailFetchTitle(_ error: any Error) {
        errorCounts += 1
    }
}
