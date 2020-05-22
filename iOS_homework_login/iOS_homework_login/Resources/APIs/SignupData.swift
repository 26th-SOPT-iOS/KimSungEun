//
//  SignupData.swift
//  iOS_homework_login
//
//  Created by 김성은 on 16/05/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct SignupData: Codable {
    var status: Int
    var success: Bool
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}
