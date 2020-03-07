//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Nikola on 7.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let article: Article
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = article.title
        setupViews()
    }

    private func setupViews() {
        if let urlToImage = article.urlToImage {
            thumbnailImageView.kf.setImage(with: URL(string: urlToImage))
        }
        thumbnailImageView.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.size.width, height: view.frame.size.width * (9 / 16)))
        tableView.tableHeaderView = thumbnailImageView
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewsDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultTableViewCell", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = article.content
            return cell
        default:
            return UITableViewCell()
        }
    }
}
