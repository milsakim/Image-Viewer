//
//  ListViewLoadData.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

enum LoadImageError: Error {
    case invalidURL
}

extension ListViewController {
    
    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: url) else {
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
}
