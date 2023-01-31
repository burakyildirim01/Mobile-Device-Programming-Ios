//
//  PharmacyTableViewCell.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {

    @IBOutlet weak var pharmacyNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
