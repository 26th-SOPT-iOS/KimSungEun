//
//  FriendTableViewCell.swift
//  iOS_homework_login
//
//  Created by 김성은 on 15/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        friendImageView.layer.cornerRadius = friendImageView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setFriendInformation(friendImageName: String, name: String, status: String) {
        friendImageView.image = UIImage(named: friendImageName)
        nameLabel.text = name
        statusLabel.text = status
    }
}
