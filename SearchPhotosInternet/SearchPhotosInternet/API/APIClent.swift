//
//  APIClent.swift
//  SearchPhotosInternet
//
//  Created by Bobomurod Ergashev on 02/10/22.
//

import Foundation

import Alamofire


class APIClient {
    
    
    @discardableResult
    static func performRequestScale<T:Codable>(route : ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion : @escaping (T?) -> Void ) -> DataRequest {
        return AF.request(route).responseDecodable(decoder: decoder) { (response : AFDataResponse<T>) in
            let result = response.result
            switch result {
            case .success(let resData) :
                completion(resData)
            case .failure(let error) :
                completion(nil)
            }
        }
    }
    
    
    static func getCurrentWeather(completion :@escaping (WeatherModel?) -> Void) {
        APIClient.performRequestScale(route: .currentWeather, completion: completion)
    }
}
