//
//  ListCommentsTableViewCell.swift
//  KumparanTest
//
//  Created by Hayden Lui on 17/11/21.
//

import UIKit

class ListCommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblBody : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(comment : Comments) {
        lblName.text = "Author Name: \(comment.name ?? "")"
        lblBody.text = "Body: \(comment.body ?? "")"
    }

}
