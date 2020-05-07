//
//  LaunchViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 18/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func login(_ sender: Any) {
        /*if idTextField.text == "" {
            simpleAlert(title: "로그인 실패", message: "아이디를 입력해주세요.")
        }
        else if passTextField.text == "" {
            simpleAlert(title: "로그인 실패", message: "비밀번호를 입력해주세요.")
        }
        else {*/
            guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
            
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true, completion: nil)
        //}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let paddings: [UIView] = [UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height))]
        
        idTextField.layer.cornerRadius = 22
        idTextField.leftView = paddings[0]
        idTextField.rightView = paddings[1]
        idTextField.leftViewMode = .always
        idTextField.rightViewMode = .always
        
        passTextField.layer.cornerRadius = 22
        passTextField.leftView = paddings[2]
        passTextField.rightView = paddings[3]
        passTextField.leftViewMode = .always
        passTextField.rightViewMode = .always
        
        loginButton.layer.cornerRadius = 24
    }

    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인",style:.default)
        
        alert.addAction(okAction)
        
        present(alert,animated: true)
    }

}

