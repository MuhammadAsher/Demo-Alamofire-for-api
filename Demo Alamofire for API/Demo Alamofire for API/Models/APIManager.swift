//
//  APIManager.swift
//  Demo Alamofire for API
//
//  Created by Muhammad Asher Azeem on 03/08/2021.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias SuccessBlock = (JSON) -> Void
typealias ErrorBlock = (Error) -> Void

class APIManager {
    
    // MARK: - Varibales

    static var share = APIManager()
    
    var successResponse: SuccessBlock!
    var errorResoponse: ErrorBlock!
   // var urlString = "https://jsonplaceholder.typicode.com/todos"
    
    
    // MARK: - Init
    init() {
    }
    
    // MARK: - API Call Request
    func callAPIRequest(urlString: String, successCompletion: @escaping SuccessBlock, errorCompletio: @escaping ErrorBlock) {
        AF.request(urlString, method: .get).responseJSON { response in
            if let error = response.error {
                errorCompletio(error)
            } else {
                if let responseData = response.data {
                    let json = JSON(responseData)
                    successCompletion(json)
                }
            }
        }
    }
}
