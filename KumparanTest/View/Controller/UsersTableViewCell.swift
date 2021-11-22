//
//  UsersTableViewCell.swift
//  KumparanTest
//
//  Created by Hayden Lui on 08/11/21.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUserName : UILabel!
    @IBOutlet weak var lblCompanyName : UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(user: Users){
        lblUserName.text = "User Name : \(user.username ?? "")"
        lblCompanyName.text = "Company Name : \(user.company?.name ?? "")"
    }

}
