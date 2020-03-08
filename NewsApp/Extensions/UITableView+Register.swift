//
//  UITableView+Register.swift
//  NewsApp
//
//  Created by Nikola on 8.3.2020..
//  Copyright © 2020 Nikola. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: type.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: type.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier: \(identifier)")
        }
        return cell
    }
    
    func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        let identifier = String(describing: type.self)
        self.register(T.self, forCellReuseIdentifier: identifier)
    }
}
