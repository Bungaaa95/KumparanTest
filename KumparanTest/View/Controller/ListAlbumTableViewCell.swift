//
//  ListAlbumTableViewCell.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import UIKit
import Nuke

class ListAlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var imgThumbnail : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(album: Album) {
        lblTitle.text = album.title
        if let url = URL(string: album.thumbnailUrl ?? "") {
            Nuke.loadImage(with: url, into: self.imgThumbnail, progress: nil, completion: nil)
        }
    }

}
