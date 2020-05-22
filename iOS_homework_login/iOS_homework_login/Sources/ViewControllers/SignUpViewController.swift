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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passTextField.text else { return }
        guard let inputNAME = nameTextField.text else { return }
        guard let inputEMAIL = emailTextField.text else { return }
        guard let inputPHONE = phoneTextField.text else { return }
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
            case .success(_ ):
                UserDefaults.standard.set(self.idTextField.text, forKey: "id")
                UserDefaults.standard.set(self.passTextField.text, forKey: "pwd")
                
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
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
    
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let paddings: [UIView] = [UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height))]
        
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
        
        nameTextField.layer.cornerRadius = 22
        nameTextField.leftView = paddings[4]
        nameTextField.rightView = paddings[5]
        nameTextField.leftViewMode = .always
        nameTextField.rightViewMode = .always
        
        emailTextField.layer.cornerRadius = 22
        emailTextField.leftView = paddings[6]
        emailTextField.rightView = paddings[7]
        emailTextField.leftViewMode = .always
        emailTextField.rightViewMode = .always
        
        phoneTextField.layer.cornerRadius = 22
        phoneTextField.leftView = paddings[8]
        phoneTextField.rightView = paddings[9]
        phoneTextField.leftViewMode = .always
        phoneTextField.rightViewMode = .always
        
        signUpButton.layer.cornerRadius = 24
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
