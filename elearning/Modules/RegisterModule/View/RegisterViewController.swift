//
//  RegisterViewController.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import UIKit
import ProgressHUD

class RegisterViewController: UIViewController {
    
    let viewModel: RegisterViewModel = RegisterViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cellphoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func didTapRegister(_ sender: Any) {
        ProgressHUD.show()
        //let user = UserRequest(nombre: "rubio", email: "rubio@gmail.com", celular: 912345678, password: "rubio", _id: nil)
        
        let user = getUserViewData()
        viewModel.createUser(user: user) { [weak self] (result, errorResponse) in
            ProgressHUD.dismiss()
            guard let welf = self else{
                return
            }
            if let error = errorResponse{
                print(error.errorDescription ?? "error called Api Song")
                return
            }
            
            debugPrint(result?._id ?? "sin ID")
            let alert = UIAlertController(title: "Mensaje", message: "Registro correcto", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
    
                welf.navigationController?.popViewController(animated: true)
            }))
            
            welf.present(alert, animated: true)
            
            
        }
    }
    
    @IBAction func didTapReturnLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getUserViewData() -> UserRequest{
        
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let cellphone = Int(cellphoneTextField.text ?? "")
        
        return UserRequest(nombre: name, email: email, celular: cellphone, password: password, _id: nil)
    }
    func setUserInForm(user: String?){
        print(user ?? "No user")
    }
    
}
