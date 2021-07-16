//
//  Post.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

class Post {
    
    var id: Int
    var image: String
    var title: String
    
    init(id: Int, image: String, title: String) {
        self.id = id
        self.image = image
        self.title = title
    }
    
}
