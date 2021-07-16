//
//  TableViewDelegate.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("--- willDisplay: \(indexPath.row) ---")
        
        guard let cell = cell as? ListViewTableViewCell else { return }
        
        if let cachedImage = imageCache.object(forKey: NSNumber(value: posts![indexPath.row].id)) {
            print("--- Using a cached image: \(indexPath.row) ---")
            
            cell.thumbnailView.image = cachedImage
        } else {
            print("--- Adding a cached image: \(indexPath.row) ---")
            loadImage(from: posts![indexPath.row].image) { [self] image in
                guard let image = image else { return }
                
                cell.thumbnailView.image = image
                
                self.imageCache.setObject(image, forKey:NSNumber(value: posts![indexPath.row].id))
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("--- scrollViewWillBeginDragging ---")
    }
    
}
