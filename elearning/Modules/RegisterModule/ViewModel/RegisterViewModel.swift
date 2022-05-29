//
//  RegisterViewModel.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import Foundation
import Alamofire

class RegisterViewModel{
    let api = BaseServerManager()
    
    func createUser(user: UserRequest?, completion: @escaping (UserResponse?, AFError?)->()){
        
        let parameters:[String: Any] =
        ["nombre": user?.nombre ?? "",
         "email": user?.email ?? "",
         "celular": user?.celular ?? 0,
         "password": user?.nombre ?? ""
        ]
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let host = Endpoint.baseURLcursoAPI + Endpoint.postCreateUser
        api.sessionManager.request(host, method: .post, parameters : parameters , encoding: JSONEncoding.default , headers: headers)
            .validate()
            .responseDecodable(){(response: AFDataResponse<UserResponse>) in
                switch response.result{
                case .success(let value):
                    completion(value, nil)
                case .failure(let error):
                   completion(nil,error)
                }
            }
        
    }
}
