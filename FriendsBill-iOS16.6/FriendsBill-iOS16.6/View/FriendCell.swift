//
//  FriendCell.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 03/03/24.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendRow: UIView!
    @IBOutlet weak var friendName: UITextField!
    @IBOutlet weak var FriendBill: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
