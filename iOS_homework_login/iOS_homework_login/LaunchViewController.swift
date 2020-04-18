//
//  LaunchViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 18/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func login(_ sender: Any) {
        if idTextField.text == "" {
            simpleAlert(title: "로그인 실패", message: "아이디를 입력해주세요.")
        }
        else if passTextField.text == "" {
            simpleAlert(title: "로그인 실패", message: "비밀번호를 입력해주세요.")
        }
        else {
            guard let loginViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else { return }
            
            loginViewController.id = idTextField.text
            loginViewController.pass = passTextField.text
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginButton.layer.cornerRadius = 5.0
        signUpButton.layer.cornerRadius = 5.0
    }

    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인",style:.default)
        
        alert.addAction(okAction)
        
        present(alert,animated: true)
    }

}

