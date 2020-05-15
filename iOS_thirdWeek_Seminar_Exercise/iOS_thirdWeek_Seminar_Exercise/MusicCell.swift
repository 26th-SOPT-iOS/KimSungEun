//
//  MusicCell.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 김성은 on 15/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    static let identifier: String = "MusicCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    func set(_ musicInformation: Music) {
        albumImageView.image = musicInformation.albumImage
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
    }
}
