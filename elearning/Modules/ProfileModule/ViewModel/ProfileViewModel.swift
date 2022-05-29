//
//  ProfileViewModel.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import Foundation

import Alamofire

class ProfileViewModel{
    let api = BaseServerManager()
    
    func modifyUser(user: UserRequest?, completion: @escaping (UserResponse?, AFError?)->()){
        
        let parameters:[String: Any] =
        ["nombre": user?.nombre ?? "",
         "email": user?.email ?? "",
         "celular": user?.celular ?? 0,
         "password": user?.nombre ?? ""
        ]
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let host = Endpoint.baseURLcursoAPI + Endpoint.putUser + (user?._id ?? "")
        api.sessionManager.request(host, method: .put, parameters : parameters , encoding: JSONEncoding.default , headers: headers)
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
    
    func deleteUser(user: UserRequest?, completion: @escaping (ProfileResponse?, AFError?)->()){
        
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let host = Endpoint.baseURLcursoAPI + Endpoint.deleteUser + (user?._id ?? "")
        api.sessionManager.request(host, method: .delete, encoding: JSONEncoding.default , headers: headers)
            .validate()
            .responseDecodable(){(response: AFDataResponse<ProfileResponse>) in
                switch response.result{
                case .success(let value):
                    completion(value, nil)
                case .failure(let error):
                   completion(nil,error)
                }
            }
        
    }
}
