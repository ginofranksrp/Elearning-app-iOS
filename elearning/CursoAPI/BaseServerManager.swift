//
//  BaseServerManager.swift
//  elearning
//
//  Created by Gino Franks Rubio Pacheco on 28/05/22.
//

import Foundation
import Alamofire

class BaseServerManager: SessionDelegate{
    let sessionManager: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        configuration.timeoutIntervalForResource = 400
        configuration.timeoutIntervalForRequest = 400
        sessionManager = Alamofire.Session(configuration: configuration, serverTrustManager: nil)
    }
}
