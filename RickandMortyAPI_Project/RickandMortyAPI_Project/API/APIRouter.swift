//
//  APIRouter.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 05/10/22.
//

import Foundation
import Alamofire


enum APIRouter : URLRequestConvertible {
  
    
    case currentweather
    case rickandmorty
    
    
    // url
    var path : String {
        switch self {
        case .currentweather:
            return URLS.getcurrentweatherurl
        case .rickandmorty :
            return URLS.getricandmortyurl
        }
    }
    
    
    // method
    var method : HTTPMethod {
        switch self {
        case .currentweather:
            return .get
        case .rickandmorty :
            return .get
        }
    }
    
    
    
    // querry
    var query : Parameters {
        switch self {
        case .currentweather:
            return ["lat": 42.2840274475893,
                    "lon": 69.22443954548164,
                    "appid" : "3564b7a412f64b0612e9ca4343823276",
                    "units" : "metric" ]
           
        
            
        case .rickandmorty : return [:]
        }
    }
    
    
    // body
    var parameters : Parameters? {
        return nil
    }
    
    
    
    
    
    
    
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try path.asURL())
        
        urlRequest.httpMethod = method.rawValue
        
        
        if query != nil {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: query)
            print("Sending query: \(String(describing: query))" )
            
        }
        
        
        // headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        // body
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
