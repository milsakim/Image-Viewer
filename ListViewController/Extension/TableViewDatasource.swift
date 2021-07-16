//
//  TableViewDatasource.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            guard let posts = self.posts else {
                print("--- numberOfRowsInSection: 0 ---")
                
                return 0
            }
            
            print("--- numberOfRowsInSection: \(posts.count) ---")
            
            return posts.count
        } else if section == 1 && isFetchingData {
            return 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("--- cellForRowAt: \(indexPath) ---")
        
        if indexPath.section == 0 {
            let cell: ListViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: ListViewTableViewCell.id) as! ListViewTableViewCell
            
            if posts != nil, indexPath.row < posts!.count {
                cell.titleLabel.text = posts![indexPath.row].title
            }
            
            return cell
        } else {
            let cell: LoadingTableViewCell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.id) as! LoadingTableViewCell
            
            cell.startIndicator()
            
            return cell
        }
    }

}
