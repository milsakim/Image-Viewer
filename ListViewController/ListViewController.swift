//
//  ListViewController.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Property
    
    var posts: [Post]?
    
    let imageCache: NSCache<NSNumber, UIImage> = NSCache()
    
    var isFetchingData: Bool = false
    
    // MARK: Deinit
    
    deinit {
        if posts != nil {
            posts = nil
        }
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commonInit()
    }
    
    // MARK: Common Init
    
    func commonInit() {
        setupTableView()
        generatePostData(number: 10)
        // tableView.reloadData()
    }
    
    func generatePostData(number: Int) {
        print("--- generatePostData ---")
        
        if posts == nil {
            posts = []
        }
        
        if posts != nil {
            let baseTitle = "This is image number "
            
            for i in posts!.count...(posts!.count + number) {
                posts!.append(Post(id: i, image: "https://picsum.photos/200", title: baseTitle + String(i)))
            }
        }
        
        tableView.reloadData()
        isFetchingData = false
    }

}
