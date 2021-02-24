//
//  MainTableViewCell.swift
//  Devour project 405
//
//  Created by Dowon on 2/24/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodInfoView: UIView!
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
