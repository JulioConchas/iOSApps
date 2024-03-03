//
//  ViewController.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 03/02/24.
//
// 02/05/2024 Julio Conchas Adding delegate function for TextFields
//

import UIKit
import FirebaseAuth

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends : [Friend] = [
        Friend()
    ]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = Constants.APP_NAME
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: Constants.CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: Constants.CELL_IDENTIFIER)
    }
}
// MARK: - UITableViewDataSource
extension CalculatorViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_IDENTIFIER, for: indexPath) as! FriendCell
        // cell.textLabel?.text = friends[indexPath.row].friendName
        return cell
    
    }
}


