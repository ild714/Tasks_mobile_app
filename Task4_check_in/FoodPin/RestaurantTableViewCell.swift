//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Ильдар Нигметзянов on 26/07/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

   
    
    @IBOutlet var like: UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
         {
        didSet{
            thumbnailImageView.layer.cornerRadius = 30.0
            thumbnailImageView.clipsToBounds = true 
        }
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
