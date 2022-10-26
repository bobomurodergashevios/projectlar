//
//  APIClient.swift
//  RickandMortyAPI_Project
//
//  Created by Bobomurod Ergashev on 05/10/22.
//

import Foundation
import Alamofire
import UIKit

struct APIClient {
 
    
    
//    return AF.request(route).responseDecodable(decoder: decoder) { (response : AFDataResponse<T>) in
//        let result = response.result
//        switch result {
//        case .success(let resData) :
//            completion(resData)
//        case .failure(let error) :
//            completion(nil)
//        }
//    }
    @discardableResult
    static func performRequestScale<T:Codable>(route : APIRouter , decoder: JSONDecoder =  JSONDecoder() , completion : @escaping (T?) -> Void) -> DataRequest {
        return AF.request(route).responseDecodable(decoder: decoder) { (response : AFDataResponse<T>) in
            let result = response.result
            switch result {
            case .success(let resData) :
                completion(resData)
            case .failure(let error) :
                completion(nil)
                print("error")
            }
        }
    }
    
    
    static func getCurrentWeather(completion :@escaping (WeatherModel?) -> Void) {
        APIClient.performRequestScale(route: .currentweather, completion: completion)
    }
//    static func getRickandMorty(completion :@escaping (Results?) -> Void) {
//        APIClient.performRequestScale(route: .rickandmorty, completion: completion)
//    }
    
    
}
