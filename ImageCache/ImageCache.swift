//
//  ImageCache.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

protocol ImageCacheType: AnyObject {
    func image(for url: URL) -> UIImage?
    func insertImage(_ image: UIImage?, for url: URL)
    func removeImage(for url: URL)
    func removeAllImages()
    subscript(_ url: URL) -> UIImage? { get set }
}

class ImageCache {
    
    private var imageCache: NSCache<NSURL, UIImage> = NSCache<NSURL, UIImage>()
    
}

extension ImageCache: ImageCacheType {
    
    func image(for url: URL) -> UIImage? {
        if let image = imageCache.object(forKey: NSURL(fileURLWithPath: url.path)) {
            return image
        }
        
        return nil
    }
    
    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image = image else { return }
        imageCache.setObject(image, forKey: NSURL(fileURLWithPath: url.path))
    }
    
    func removeImage(for url: URL) {
        imageCache.removeObject(forKey: NSURL(fileURLWithPath: url.path))
    }
    
    func removeAllImages() {
        imageCache.removeAllObjects()
    }
    
    subscript(url: URL) -> UIImage? {
        get {
            return image(for: url)
        }
        set {
            return insertImage(newValue, for: url)
        }
    }
    
}
