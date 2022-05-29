//
//  LoginViewModel.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import Foundation
import Alamofire

class LoginViewModel{
    let api = BaseServerManager()
    
    func login(login: LoginRequest?, completion: @escaping (LoginResponse?, AFError?)->()){
        
        let parameters:[String: Any] =
        [
         "email": login?.email ?? "",
         "password": login?.password ?? ""
        ]
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let host = Endpoint.baseURLcursoAPI + Endpoint.postLogin
        api.sessionManager.request(host, method: .post, parameters : parameters , encoding: JSONEncoding.default , headers: headers)
            .validate()
            .responseDecodable(){(response: AFDataResponse<LoginResponse>) in
                switch response.result{
                case .success(let value):
                    completion(value, nil)
                case .failure(let error):
                   completion(nil,error)
                }
            }
        
    }
}
