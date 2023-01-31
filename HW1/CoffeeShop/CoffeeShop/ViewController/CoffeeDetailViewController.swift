//
//  CoffeeDetailViewController.swift
//  CoffeeShop
//
//  Created by BURAK on 17.11.2022.
//

import UIKit

class CoffeeDetailViewController: UIViewController {
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    
    @IBOutlet weak var coffeeNameLabel: UILabel!
    
    @IBOutlet weak var coffeeBitternessLabel: UILabel!
    
    @IBOutlet weak var coffeeFlavorLabel: UILabel!
    
    @IBOutlet weak var coffeeBenefitsLabel: UILabel!
    
    @IBOutlet weak var coffeePriceLabel: UILabel!
    
    var coffeeIdentifier: Int?
    
    let coffeeDataSource = CoffeeDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let coffeeIdentifier = coffeeIdentifier,
            let coffee = coffeeDataSource.getCoffee(for: coffeeIdentifier) {
            coffeeImageView.image = UIImage(named: coffee.imageName)
            coffeeNameLabel.text = "\(coffee.coffeeName)"
            coffeePriceLabel.text = "\(coffee.price)"
            coffeeFlavorLabel.text = "\(coffee.flavor)"
            coffeeBenefitsLabel.text = "\(coffee.benefits)"
            coffeeBitternessLabel.text = "\(coffee.bitterness)"
            self.title = coffee.coffeeName
        } else {
            coffeeImageView.image = nil
            coffeePriceLabel.text = "N/A"
            coffeeFlavorLabel.text = "N/A"
            coffeeBitternessLabel.text = "N/A"
            coffeeBenefitsLabel.text = "N/A"
            coffeeNameLabel.text = "N/A"
            self.title = "Coffee Not Found"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
