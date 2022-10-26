//
//  APIRouter.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 02/10/22.
//

import Foundation
import UIKit
import Alamofire

enum ApiRouter : URLRequestConvertible {
    case currentWeather
    
    // url
    var path : String {
        switch self {
        case .currentWeather:
            return URLS.getCurrent
        }
    }
    
    //api-type
    var method: HTTPMethod {
        switch self {
        case .currentWeather:
            return .get
        }
    }
    
    
    
    //querry
    var queries:Parameters?{
        
           switch self {
           case .currentWeather:
               return
               ["lat":"42.2840274475893 ",
                "lon":"69.22443954548164",
                "appid":"b5f722237d299e91a2784bfae4",
                "units":"metric"]
           }
       }
    
    
    // body
    var parameters : Parameters? {
        return nil
    }
    
    
    
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try path.asURL())
        
        urlRequest.httpMethod = method.rawValue
        
        
        if queries != nil {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queries)
            print("Sending queries: \(String(describing: queries))" )
            
        }
        // headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                
            }
        }
        return urlRequest
    }
}

