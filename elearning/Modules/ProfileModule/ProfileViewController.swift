//
//  ProfileViewController.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import UIKit

import ProgressHUD

class ProfileViewController: UIViewController {

    var user: UserRequest?
    
    let viewModel = ProfileViewModel()
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData(nombre: user?.nombre, email: user?.email)
        // Do any additional setup after loading the view.
    }

    func getUserRequest() -> UserRequest{
        
        let nombre = nombreTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        return UserRequest(nombre: nombre, email: email, celular: nil, password: password, _id: user?._id)
    }

    @IBAction func didTapActualizar(_ sender: Any) {
        
        ProgressHUD.show()
        let usuario = getUserRequest()
        viewModel.modifyUser(user: usuario) { [weak self] (result, errorResponse) in
            ProgressHUD.dismiss()
            guard let welf = self else{
                return
            }
            if let error = errorResponse{
                print(error.errorDescription ?? "error called Api Song")
                return
            }
            
            debugPrint(result?._id ?? "sin ID")
            let alert = UIAlertController(title: "Mensaje", message: "Actualizacion correcta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
                
                welf.setData(nombre: result?.nombre, email: result?.email)
                
            }))
            
            welf.present(alert, animated: true)


        }
        
    }
    
    @IBAction func didTapEliminar(_ sender: Any) {
        
        ProgressHUD.show()
        
        viewModel.deleteUser(user: user) { [weak self] (result, errorResponse) in
            ProgressHUD.dismiss()
            guard let welf = self else{
                return
            }
            if let error = errorResponse{
                print(error.errorDescription ?? "error called Api Song")
                return
            }
            
            debugPrint(result?.msg ?? "sin ID")
            
            let alert = UIAlertController(title: "Mensaje", message: result?.msg , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
                
                welf.navigationController?.popToRootViewController(animated: true)
            }))
            
            welf.present(alert, animated: true)

        }
        
    }
    @IBAction func didTapReturn(_ sender: Any) {
        
        
    }
    
    func setData(nombre: String?, email: String? ){
        
        nombreTextField.text = nombre
        emailTextField.text = email
        
    }
    func alertResponse(title: String?, message: String?){
        
    }
}
