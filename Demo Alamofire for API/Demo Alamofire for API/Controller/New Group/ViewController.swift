//
//  ViewController.swift
//  Demo Alamofire for API
//
//  Created by Muhammad Asher Azeem on 03/08/2021.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    
    // MARK: - Varibales

    var urlString = "https://jsonplaceholder.typicode.com/todos"
    var todosDataArr: [Todos] = []
    
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        callService(urlString)
    }
    
    func callService(_ url: String) {
        activityIndicator.startAnimating()
        APIManager.share.callAPIRequest(urlString: url) { responseJSON in
            self.activityIndicator.stopAnimating()
            print("Response JSON \(responseJSON)")
            // assign data to jsonresponseHandler
            self.jsonResponseHandler(responseJSON)
        } errorCompletio: { error in
            self.activityIndicator.stopAnimating()
            print("Error \(error.localizedDescription)")
        }
    }
    
    func setupTableView() {
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.register(UINib(nibName: "TodosTableViewCell", bundle: nil), forCellReuseIdentifier: "TodosTableViewCell")
    }
    
    func jsonResponseHandler(_ json: JSON) {
        todosDataArr.removeAll()
        json.forEach({todosDataArr.append(Todos(json: $0.1))})
        self.customTableView.reloadData()
    }
}


// MARK: - available
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodosTableViewCell", for: indexPath) as! TodosTableViewCell
        cell.idLabel.text = String(todosDataArr[indexPath.row].id ?? 0)
        cell.tileLabel.text = todosDataArr[indexPath.row].title
        cell.activationView.backgroundColor = todosDataArr[indexPath.row].completed ? .green : .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
