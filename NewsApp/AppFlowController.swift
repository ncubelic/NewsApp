//
//  AppFlowController.swift
//  NewsApp
//
//  Created by Nikola on 2.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import UIKit

class AppFlowController: UIViewController {
    
    lazy var ownedNavigtaionController: UINavigationController = {
       return UINavigationController()
    }()
    
    private let networkManager = NetworkManager()
    private let newsService: NewsService
    private let newsListViewController = NewsListViewController(articles: [])
    
    init() {
        newsService = NewsService(networkManager: networkManager)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews()
    }
    
    override func loadView() {
        super.loadView()
        
        newsListViewController.delegate = self
        ownedNavigtaionController.setViewControllers([newsListViewController], animated: false)
        add(ownedNavigtaionController)
    }
    
    private func loadNews() {
        newsService.fetchNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let news):
                self.newsListViewController.update(articles: news.articles)
            case .failure(let errorReport):
                ErrorHandler(rootViewController: self.newsListViewController).handle(errorReport)
            }
        }
    }
    
    private func show(_ article: Article) {
        let newsDetailsController = NewsDetailsViewController(article: article)
        ownedNavigtaionController.pushViewController(newsDetailsController, animated: true)
    }
}

extension AppFlowController: NewsListViewControllerDelegate {
    
    func newsListViewController(_ controller: NewsListViewController, shouldSearchQueryString queryString: String) {
        print("Here goes API request with query string.")
        print("This is how I'll do it.")
    }
    
    func newsListViewController(_ controller: NewsListViewController, didSelect article: Article) {
        show(article)
    }
}
