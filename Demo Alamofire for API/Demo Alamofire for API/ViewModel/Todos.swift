//
//  Todos.swift
//  Demo Alamofire for API
//
//  Created by Muhammad Asher Azeem on 03/08/2021.
//

import UIKit
import SwiftyJSON

struct Todos {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool
    
    init(json: JSON) {
        userId = json["userId"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        completed = json["completed"].boolValue
    }
}
