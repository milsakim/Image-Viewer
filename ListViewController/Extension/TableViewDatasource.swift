//
//  TableViewDatasource.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = self.posts else {
            print("--- numberOfRowsInSection: 0 ---")
            
            return 0
        }
        
        print("--- numberOfRowsInSection: \(posts.count) ---")
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("--- cellForRowAt: \(indexPath) ---")
        
        let cell: ListViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: ListViewTableViewCell.id) as! ListViewTableViewCell
        
        if posts != nil, indexPath.row < posts!.count {
            cell.titleLabel.text = posts![indexPath.row].title
        }
        
        return cell
    }

}
