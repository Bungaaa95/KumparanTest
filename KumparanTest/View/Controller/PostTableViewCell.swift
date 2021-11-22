//
//  PostTableViewCell.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(post: Posts) {
        lblTitle.text = post.title
        lblBody.text = post.body
    }

}
