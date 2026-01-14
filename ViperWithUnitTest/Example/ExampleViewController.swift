// 
//  ExampleViewController.swift
//  ViperWithUnitTest
//
//  Created by Yani . on 13/01/26.
//

import UIKit

final class ExampleViewController: UIViewController {

    var presenter: ExamplePresenterProtocol?

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var retryButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Retry", for: .normal)
        return button
    }()

    private lazy var spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.style = .medium
        return spinner
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

extension ExampleViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground

        retryButton.addTarget(self, action: #selector(didTapRetry), for: .touchUpInside)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(spinner)
        stackView.addArrangedSubview(retryButton)

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc private func didTapRetry() {
        presenter?.didTapRetry()
    }
}

extension ExampleViewController: ExampleViewProtocol {
    func showLoading(_ isLoading: Bool) {
        isLoading ? spinner.startAnimating() : spinner.stopAnimating()
        retryButton.isEnabled = !isLoading
    }
    
    func showTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func showError(_ message: String) {
        titleLabel.text = message
    }

}
