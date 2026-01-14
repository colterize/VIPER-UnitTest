// 
//  ExamplePresenter.swift
//  ViperWithUnitTest
//
//  Created by Yani . on 13/01/26.
//

final class ExamplePresenter: ExamplePresenterProtocol, ExampleInteractorOutputProtocol {
    private weak var view: ExampleViewProtocol?
    private let interactor: ExampleInteractorProtocol
    private let router: ExampleRouterProtocol

    init(view: ExampleViewProtocol,
         interactor: ExampleInteractorProtocol,
         router: ExampleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        view?.showLoading(true)
        interactor.fetchTitle()
    }

    func didTapRetry() {
        view?.showLoading(true)
        interactor.fetchTitle()
    }

    func didFetchTitle(_ title: String) {
        view?.showLoading(false)
        view?.showTitle(title)
    }

    func didFailFetchTitle(_ error: any Error) {
        view?.showLoading(false)
        view?.showError("Something went wrong")
    }

    func goNext() {
        router.routeToNext()
    }
}
