//
//  ChatViewController.swift
//  TaanChat-iOS16.5
//
//  Created by Julio Conchas on 17/02/24.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages : [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        title = Constants.APP_NAME
        navigationItem.hidesBackButton = true
        
        //Register table cell Nib
        tableView.register(UINib(nibName: Constants.CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: Constants.CELL_IDENTIFIER)
        
        loadMessages()
        
    }
    func loadMessages()
    {
       // db.collection(Constants.COLLECTION_NAME).getDocuments { (querySnapshot, error ) in
        db.collection(Constants.COLLECTION_NAME).order(by: Constants.DATE_FIELD).addSnapshotListener { (querySnapshot, error ) in
            if let e = error
            {
                print("There wasa an issue retrieving data from Firestore : \(e)")
            }
            else
            {
                // lean the dummy messages
                self.messages = []
                
                if let snapshotDocuments = querySnapshot?.documents
                {
                    for doc in snapshotDocuments
                    {
                        let data = doc.data()
                        if let sender = data[Constants.SENDER_FIELD] as? String, let body = data[Constants.BODY_FIELD] as? String
                        {
                            self.messages.append(Message(sender: sender, body: body))
                            DispatchQueue.main.async // <=== Most for update GUI
                            {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    @IBAction func sendPressed(_ sender: UIButton)
    {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email
        {
            db.collection(Constants.COLLECTION_NAME).addDocument(data: [Constants.SENDER_FIELD : messageSender, Constants.BODY_FIELD : messageBody, Constants.DATE_FIELD : Date().timeIntervalSince1970]) {
                (error) in
                if let e = error
                {
                    print("There was an issue saving data to firestore: \(e)")
                }
                else
                {
                    print("Successfully saved date.")
                }
            }
        }
    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem)
    {
        do 
        {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch let signOutError as NSError
        {
            print("Error signing out: %@",signOutError)
        }
    }
}
// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message  = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_IDENTIFIER, for: indexPath) as! MessageCell
        //cell.textLabel?.text = messages[indexPath.row].body
        cell.label.text = message.body
        
        // This is a message from the current user
        if message.sender == Auth.auth().currentUser?.email
        {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(red: 114, green: 92, blue: 90, alpha: 1)
            cell.label.textColor = UIColor(cgColor: CGColor(red: 1, green: 2, blue: 2, alpha: 1))
        }
        // This is a message from another user
        else
        {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(red: 130.0, green: 130.0, blue: 130.0, alpha: 1)
            cell.label.textColor = UIColor(cgColor: CGColor(red: 3, green: 10, blue: 9, alpha: 1))
        }

        return cell
    }
}
// MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate
{
    // This delegate is used to Interact with eatch cell by clicing
    // It will not be used for this app
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
