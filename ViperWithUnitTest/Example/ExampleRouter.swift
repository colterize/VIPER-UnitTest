// 
//  ExampleRouter.swift
//  ViperWithUnitTest
//
//  Created by Yani . on 13/01/26.
//

import UIKit

class ExampleRouter: ExampleRouterProtocol {
    weak var viewController: UIViewController?

    func routeToNext() {
        // let next = UIViewController()
        // viewController.navigationController?.pushViewController(next, animated: true)
    }
}

enum ExampleModuleBuilder {
    static func build(service: TitleService) -> UIViewController {
        let vc = ExampleViewController()
        let router = ExampleRouter()
        let interactor = ExampleInteractor(service: service)

        let presenter = ExamplePresenter(
            view: vc,
            interactor: interactor,
            router: router
        )

        vc.presenter = presenter
        interactor.output = presenter
        router.viewController = vc

        return vc
    }
}
