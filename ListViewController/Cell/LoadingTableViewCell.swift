//
//  LoadingTableViewCell.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    static let id: String = "LoadingTableViewCell"
    
    // MARK: Outlet

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Action
    
    func startIndicator() {
        activityIndicator.startAnimating()
    }
    
}
