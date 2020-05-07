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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
        
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let paddings: [UIView] = [UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height)), UIView(frame: CGRect(x: 0, y: 0, width: 18, height: idTextField.frame.height))]
        
        nameTextField.layer.cornerRadius = 22
        nameTextField.leftView = paddings[0]
        nameTextField.rightView = paddings[1]
        nameTextField.leftViewMode = .always
        nameTextField.rightViewMode = .always
        
        idTextField.layer.cornerRadius = 22
        idTextField.leftView = paddings[2]
        idTextField.rightView = paddings[3]
        idTextField.leftViewMode = .always
        idTextField.rightViewMode = .always
        
        passTextField.layer.cornerRadius = 22
        passTextField.leftView = paddings[4]
        passTextField.rightView = paddings[5]
        passTextField.leftViewMode = .always
        passTextField.rightViewMode = .always
        
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
