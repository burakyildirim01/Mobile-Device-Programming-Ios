//
//  CoffeeTableViewCell.swift
//  CoffeeShop
//
//  Created by BURAK on 17.11.2022.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    
    @IBOutlet weak var coffeeNameLabel: UILabel!
    
    @IBOutlet weak var coffeePriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
