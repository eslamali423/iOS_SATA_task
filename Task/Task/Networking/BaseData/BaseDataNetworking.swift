//
//  BaseDataNetworking.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import Foundation
import Alamofire

enum BaseDataNetwroking {
    case getData
}

extension BaseDataNetwroking : TargetType {
    var baseUrl: String {
        switch self {
        default :
                return "http://satafood.codesroots.com:3000/api/branches/homepage"

        }
    }
    
    var path: String {
        switch self {
        case .getData:
            return ""
       

        }
    }
    
    var method: HTTPMethod {
        switch self  {
        case .getData :
            return .get
            
     
        }
    }
    
    var task: Task {
        switch self {
        case .getData:
            return .requestPlain
       
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}


