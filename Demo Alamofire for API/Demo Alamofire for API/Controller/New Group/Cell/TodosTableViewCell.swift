//
//  TodosTableViewCell.swift
//  Demo Alamofire for API
//
//  Created by Muhammad Asher Azeem on 03/08/2021.
//

import UIKit

class TodosTableViewCell: UITableViewCell {

    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var activationView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func assignTodoData(_ todo: Todos) {
        tileLabel.text = todo.title
        idLabel.text = String(describing: todo.id)
    }
    
}
