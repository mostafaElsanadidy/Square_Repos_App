//
//  RepoCell.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var visibilityLabel: UILabelX!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var langStackView: UIStackView!
    @IBOutlet weak var langLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
