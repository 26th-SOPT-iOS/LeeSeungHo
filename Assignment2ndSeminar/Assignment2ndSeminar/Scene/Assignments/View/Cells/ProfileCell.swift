//
//  MyProfileCell.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var underBar: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setImageRound(profileImage, section: 10)
    }
    
    
    func setImageRound(_ image: UIImageView, section: CGFloat) {
            
        image.layer.cornerRadius = image.frame.height/2 - section
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.clear.cgColor
        image.clipsToBounds = true
        
    }
    
    func settings(_ profileSettings: Friends) {
        profileImage.image = profileSettings.profileImage
        nameLabel.text = profileSettings.name
        statusLabel.text = profileSettings.subTitle
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
