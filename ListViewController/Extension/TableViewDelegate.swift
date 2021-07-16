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
//        print("--- scrollViewWillBeginDragging ---")
//        print("--- scrollView contentOffset: \(scrollView.contentOffset) ---")
//        print("--- tableView contentSize: \(tableView.contentSize) ---")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("scrollView contentOffset: \(scrollView.contentOffset)")
//        print("scrollView contentSize: \(scrollView.contentSize)")
//        print("scrollVoew frame: \(scrollView.frame)\n\n")
        
        let offsetY = scrollView.contentOffset.y
        let contentSizeHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.height
        
        if offsetY >= (contentSizeHeight - frameHeight) {
            if !isFetchingData {
                isFetchingData = true
                tableView.reloadSections(IndexSet(integer: 1), with: .none)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.generatePostData(number: 10)
                }
            }
        }
    }
    
}
