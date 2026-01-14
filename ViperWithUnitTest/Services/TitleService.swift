//
//  TitleService.swift
//  ViperWithUnitTest
//
//  Created by Yani . on 13/01/26.
//

protocol TitleService {
    func getTitle(completion: @escaping (Result<String, Error>) -> Void)
}

enum ServiceError: Error {
    case unknownError
}

final class RealTitleService: TitleService {
    func getTitle(completion: @escaping (Result<String, any Error>) -> Void) {
        completion(.success("Hello World!"))
    }
}
