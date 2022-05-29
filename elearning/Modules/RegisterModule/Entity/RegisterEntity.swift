//
//  RegisterEntity.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import Foundation

struct UserRequest: Codable{
    
    let nombre: String?
    let email: String?
    let celular: Int?
    let password: String?
    let _id: String?
}

struct UserResponse: Codable{

    let nombre: String?
    let email: String?
    let celular: Int?
    let _id: String?
}
