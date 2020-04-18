//
//  LoginViewController.swift
//  iOS_homework_login
//
//  Created by 김성은 on 18/04/2020.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var id: String?
    var pass: String?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBAction func logoutDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setValues()
    }
    
    private func setValues() {
        guard let id = self.id else { return }
        guard let pass = self.pass else { return }
        
        idTextField.text = id
        passTextField.text = pass
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
