//
//  WeatherCell.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 김성은 on 15/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDateInformation(weatherImageName: String, date: String, subTitle: String) {
        weatherImageView.image = UIImage(named: weatherImageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }
}
