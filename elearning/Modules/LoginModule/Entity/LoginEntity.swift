//
//  UserEntity.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import Foundation

struct LoginRequest: Codable{
    let email: String?
    let password: String?
}

struct LoginResponse: Codable{

    let nombre: String?
    let email: String?
    let celular: Int?
    let _id: String?
}
