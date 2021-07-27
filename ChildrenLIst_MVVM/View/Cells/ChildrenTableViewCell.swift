//
//  ChildrenTableViewCell.swift
//  fff
//
//  Created by Anatoliy Mamchenko on 25.07.2021.
//

import UIKit

class ChildrenTableViewCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(child: Child) {
        nameLabel.text = child.name
        ageLabel.text = "\(child.age)"
    }

}
