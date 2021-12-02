//
//  SecondViewController.swift
//  Demo Alamofire for API
//
//  Created by Muhammad Asher Azeem on 03/08/2021.
//

import UIKit

class SecondViewController: UIViewController {

    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callService(urlString)
    }
    
    func callService(_ url: String) {
        APIManager.share.callAPIRequest(urlString: url) { responseJSON in
            print("Response JSON \(responseJSON)")
        } errorCompletio: { error in
            print("Error \(error.localizedDescription)")
        }
    }

}
