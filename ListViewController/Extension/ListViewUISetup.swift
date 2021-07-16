//
//  ListViewUISetup.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

extension ListViewController {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ListViewTableViewCell.id, bundle: .main), forCellReuseIdentifier: ListViewTableViewCell.id)
        tableView.register(UINib(nibName: LoadingTableViewCell.id, bundle: .main), forCellReuseIdentifier: LoadingTableViewCell.id)
    }
    
}
