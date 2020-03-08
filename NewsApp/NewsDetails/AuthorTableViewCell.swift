//
//  AuthorTableViewCell.swift
//  NewsApp
//
//  Created by Nikola on 8.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withAuthor author: String) {
        textLabel?.text = author
    }
    
    private func setupViews() {
        textLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        textLabel?.textColor = .lightGray
    }

}
