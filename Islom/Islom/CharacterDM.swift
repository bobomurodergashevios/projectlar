//
//  CharacterDM.swift
//  Islom
//
//  Created by Bobomurod Ergashev on 12/09/22.
//

import Foundation
import SwiftyJSON

class CharacterDM {
    
    var name: String
    var status: String
    var image:String
    var species: String
    
    var imageUrl: URL {
        return URL(string: image) ?? URL(string: "")!
    }
    
    var statusSpecies: String {
        return status+" - "+species
    }
    

    
    init(json data: JSON) {
        self.name = data["name"].stringValue
        self.status = data["status"].stringValue
        self.image = data["image"].stringValue
        self.species = data["species"].stringValue
    }
    
}
