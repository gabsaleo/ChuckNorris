//
//  File.swift
//  ChuckNorris
//
//  Created by Gabriella Messias Aleo on 06/11/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation

class Classe : Codable{
    var icon_url : String
    var value : String
    
    init(json: [String:Any]){
        icon_url = json["icon_url"] as? String ?? ""
        value = json["value"] as? String ?? ""
    }
}


