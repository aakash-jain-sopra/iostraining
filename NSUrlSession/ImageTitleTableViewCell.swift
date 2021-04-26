//
//  ImageTitleTableViewCell.swift
//  NSUrlSession
//
//  Created by Aakash Jain on 18/04/21.
//

import UIKit

class ImageTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblView: UILabel!
    
    weak var dataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
