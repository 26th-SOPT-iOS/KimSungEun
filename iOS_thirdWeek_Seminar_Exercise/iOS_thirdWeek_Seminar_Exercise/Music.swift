//
//  Music.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 김성은 on 15/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct Music {
    var albumImage: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String, singer: String, title: String) {
        self.albumImage = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}
