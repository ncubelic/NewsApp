//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Nikola on 2.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import UIKit

protocol NewsListViewControllerDelegate: AnyObject {
    func newsListViewController(_ controller: NewsListViewController, didSelect article: Article)
}

class NewsListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NewsItemTableViewCell.self, forCellReuseIdentifier: "NewsItemTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        return tableView
    }()

    private var articles: [Article]
    private let searchController = UISearchController(searchResultsController: nil)
    weak var delegate: NewsListViewControllerDelegate?
    
    init(articles: [Article]) {
        self.articles = articles
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        }
        title = "News"
        view.backgroundColor = .background
        
        setupViews()
    }

    func update(articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemTableViewCell", for: indexPath) as? NewsItemTableViewCell else { fatalError("Unknown cell") }
        cell.configure(with: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.newsListViewController(self, didSelect: articles[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Headlines"
    }
}
