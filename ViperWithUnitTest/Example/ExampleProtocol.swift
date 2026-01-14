// 
//  ExampleProtocol.swift
//  ViperWithUnitTest
//
//  Created by Yani . on 13/01/26.
//

// MARK: - View
protocol ExampleViewProtocol: AnyObject {
    func showLoading(_ isLoading: Bool)
    func showTitle(_ title: String)
    func showError(_ message: String)
}

// MARK: - Presenter
protocol ExamplePresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapRetry()
}

// MARK: - Interactor
protocol ExampleInteractorProtocol: AnyObject {
    func fetchTitle()
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ExampleInteractorOutputProtocol: AnyObject {
    func didFetchTitle(_ title: String)
    func didFailFetchTitle(_ error: Error)
}

// MARK: - Router
protocol ExampleRouterProtocol: AnyObject {
    func routeToNext()
}
