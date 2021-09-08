//
//  UITableView+Exts.swift
//  VIP-Implementation-Swift
//
//  Created by Duy Truong on 20/07/2021.
//

import UIKit

extension UITableView {
    convenience init(dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        self.init()
        self.dataSource = dataSource
        self.delegate = delegate
    }
}
