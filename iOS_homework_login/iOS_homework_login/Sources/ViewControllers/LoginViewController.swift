//
//  LaunchViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 18/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit
import BEMCheckBox

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var autoLoginCheck: BEMCheckBox!
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
                
            case .success(let token):
                if self.autoLoginCheck.on {
                    print("AutoLogin on")
                    UserDefaults.standard.set(inputID, forKey: "id")
                    UserDefaults.standard.set(inputPWD, forKey: "pwd")
                }
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
                mainViewController.modalPresentationStyle = .fullScreen
                self.present(mainViewController, animated: true, completion: nil)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    
    var id: String = ""
    var pwd: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let userID = UserDefaults.standard.string(forKey: "id") {
            self.id = userID
            self.pwd = UserDefaults.standard.string(forKey: "pwd") ?? ""
            
            LoginService.shared.login(id: id, pwd: pwd) { networkResult in
                switch networkResult {
                case .success(let token):
                    print("Auto Login - (ID: \(self.id), PWD: \(self.pwd))")
                    
                    guard let token = token as? String else { return }
                    UserDefaults.standard.set(token, forKey: "token")
                    print("Token: \(token)")
                    
                    guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
                    mainViewController.modalPresentationStyle = .fullScreen
                    self.present(mainViewController, animated: true, completion: nil)
                    
                case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
                    
                case .pathErr: print("path")
                case .serverErr: print("serverErr")
                case .networkFail: print("networkFail")
                }
            }
        }
        
        
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

    /*override func viewWillAppear(_ animated: Bool) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let id = ad?.userID {
            idTextField.text = id
        }
        
        if let pwd = ad?.userPWD {
            passTextField.text = pwd
        }
    }*/
    
    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인",style:.default)
        
        alert.addAction(okAction)
        
        present(alert,animated: true)
    }

}

