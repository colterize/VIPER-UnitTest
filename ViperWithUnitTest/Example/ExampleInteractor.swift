// 
//  ExampleInteractor.swift
//  ViperWithUnitTest
//
//  Created by Yani . on 13/01/26.
//

final class ExampleInteractor: ExampleInteractorProtocol {
    weak var output: ExampleInteractorOutputProtocol?
    private let service: TitleService

    init(service: TitleService) {
        self.service = service
    }

    func fetchTitle() {
        service.getTitle { [weak self] result in
            switch result {
            case .success(let title):
                self?.output?.didFetchTitle(title)
            case .failure(let error):
                self?.output?.didFailFetchTitle(error)
            }
        }
    }
}
