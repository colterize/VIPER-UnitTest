//
//  ExamplePresenterTests.swift
//  UnitTests
//
//  Created by Yani . on 13/01/26.
//

import XCTest
@testable import ViperWithUnitTest

final class ExamplePresenterTests: XCTestCase {
    func test_viewDidLoad_showsLoading_thenFetches() {
        let view = MockView()
        let interactor = MockInteractor()
        let router = MockRouter()

        let presenter = ExamplePresenter(
            view: view,
            interactor: interactor,
            router: router
        )

        presenter.viewDidLoad()

        XCTAssertEqual(view.loadingCalls, [true])
        XCTAssertEqual(interactor.fetchTitleCallCount, 1)
    }

    func test_interactorSuccess_hidesLoading_andShowTitle() {
        let view = MockView()
        let interactor = MockInteractor()
        let router = MockRouter()

        let presenter = ExamplePresenter(
            view: view,
            interactor: interactor,
            router: router
        )

        presenter.viewDidLoad()
        presenter.didFetchTitle("Hello")

        XCTAssertEqual(view.loadingCalls, [true, false])
        XCTAssertEqual(view.titles, ["Hello"])
    }
}

//MARK: - Mocks
private final class MockView: ExampleViewProtocol {
    var loadingCalls: [Bool] = []
    var titles: [String] = []
    var errors: [String] = []

    func showLoading(_ isLoading: Bool) {
        loadingCalls.append(isLoading)
    }

    func showTitle(_ title: String) {
        titles.append(title)
    }

    func showError(_ message: String) {
        errors.append(message)
    }
}

private final class MockInteractor: ExampleInteractorProtocol {
    var fetchTitleCallCount = 0

    func fetchTitle() {
        fetchTitleCallCount += 1
    }
}

private final class MockRouter: ExampleRouterProtocol {
    var routeCallCount = 0

    func routeToNext() {
        routeCallCount += 1
    }
}
