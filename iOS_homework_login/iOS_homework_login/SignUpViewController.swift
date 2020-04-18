//
//  SignUpViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 18/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var isLogout: Bool?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBAction func loginAfterSignUp(_ sender: Any) {
        guard let loginViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else { return }
        
        loginViewController.id = idTextField.text
        loginViewController.pass = passTextField.text
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
