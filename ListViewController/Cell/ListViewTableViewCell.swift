//
//  ListViewTableViewCell.swift
//  ImageViewer
//
//  Created by HyeJee Kim on 2021/07/16.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {
    
    static let id: String = "ListViewTableViewCell"

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailView.image = nil
    }
    
}
