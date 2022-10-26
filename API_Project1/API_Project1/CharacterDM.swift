//
//  CharacterDM.swift
//  API_Project1
//
//  Created by Bobomurod Ergashev on 14/09/22.
//

import Foundation
import SwiftyJSON
struct CharacterDM {
    var id : Int
    var name : String
    var status : String
    var species : String
    
    
    var location : String {
        return status+"-"+species
    }
    
    init(json data : JSON) {
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.status = data["status"].stringValue
        self.species = data["species"].stringValue
    }
}
