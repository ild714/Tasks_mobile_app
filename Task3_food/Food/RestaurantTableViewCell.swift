//
//  RestaurantTableViewCell.swift
//  Food
//
//  Created by Ильдар Нигметзянов on 08/06/2019.
//  Copyright © 2019 Ильдар Нигметзянов. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var locationLabel : UILabel!
    @IBOutlet var typeLabel : UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!{ didSet{
    thumbnailImageView.layer.cornerRadius=thumbnailImageView.bounds.width/2
        thumbnailImageView.clipsToBounds = true
    }
    }
}
