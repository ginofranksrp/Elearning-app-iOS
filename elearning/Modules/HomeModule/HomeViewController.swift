//
//  HomeViewController.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 27/05/22.
//

import UIKit

class HomeViewController: UIViewController {

    var user: UserRequest?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func didTapProfile(_ sender: Any) {
        
        
        let vc = ProfileViewController()
        vc.user = self.user
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
