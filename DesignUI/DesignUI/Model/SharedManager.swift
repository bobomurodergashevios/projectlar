//
//  SharedManager.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 20/09/22.
//

import Foundation
import UIKit


class SharedManager {
    
    static let CONTACT_KEY_PHONE = "shared_contact_phone_key"
    
    static let CONTACT_KEY_NAME = "shared_contact_name_key"
    
    static var preference = UserDefaults.standard
    
    static let APPLICATION_USER_STATE = "app_user_state"
    
   
    
    static func saveState(_ state : AppUserState){
        preference.set(state.rawValue, forKey: APPLICATION_USER_STATE)
        preference.synchronize()
    }
    static func getState()->AppUserState{
        let id = preference.integer(forKey: APPLICATION_USER_STATE)
        let state = AppUserState(rawValue: id) ?? .noregistered
        return state
    }
    
    static func logout(){
        preference.removeObject(forKey: APPLICATION_USER_STATE)
        preference.synchronize()
    }
    
    
    
    
    
    
}

enum AppUserState:Int {
    case registered = 1998
    case noregistered
}
