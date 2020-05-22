//
//  MainViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 30/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImageViewHeightConstraint: NSLayoutConstraint!
    
    @IBAction func logout(_ sender: Any) {
        print("logout")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pwd")
        UserDefaults.standard.removeObject(forKey: "token")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        
        if yPosition < 0 {
            headerImageViewHeightConstraint.constant = 210 - yPosition

        } else {
            if 210 - yPosition > 105 {
                headerImageViewHeightConstraint.constant = 210 - yPosition
            } else {
                headerImageViewHeightConstraint.constant = 105
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
