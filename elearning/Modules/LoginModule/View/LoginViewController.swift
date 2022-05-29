//
//  LoginViewController.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 27/05/22.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {
    
    var user: UserRequest?
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        passwordTextField.text = ""
        emailTextField.text = ""
    }
    func getLoginRequest() -> LoginRequest{
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        return LoginRequest(email: email, password: password)
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        
        ProgressHUD.show()
        let loginRequest = getLoginRequest()
        viewModel.login(login: loginRequest) { [weak self] (result, errorResponse) in
            ProgressHUD.dismiss()
            guard let welf = self else{
                return
            }
            if let error = errorResponse{
                print(error.errorDescription ?? "error called Api Song")
                let alert = UIAlertController(title: "Error", message: "Login incorrecto", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
        
                }))
                
                welf.present(alert, animated: true)
                return
            }
            
            welf.user = UserRequest(nombre: result?.nombre, email: result?.email, celular: result?.celular, password: nil, _id: result?._id)
            debugPrint(result?._id ?? "sin ID")
            
            let vc = HomeViewController()
            vc.user = welf.user
            welf.navigationController?.pushViewController(vc, animated: true)
  
        }
        
    }

    @IBAction func didTapRegister(_ sender: Any) {
        
        let vc = RegisterViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
