//
//  CoffeeListViewController.swift
//  CoffeeShop
//
//  Created by BURAK on 17.11.2022.
//

import UIKit

class CoffeeListViewController: UIViewController {

    @IBOutlet weak var coffeeListTableView: UITableView!
    
    private let coffeeDataSource = CoffeeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = coffeeListTableView.indexPathForSelectedRow {
            coffeeListTableView.deselectRow(at: selectedIndexPath, animated: animated)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
           let indexPath = coffeeListTableView.indexPath(for: cell),
           let detailController = segue.destination as? CoffeeDetailViewController {
            detailController.coffeeIdentifier = indexPath.row
        }
    }

}

extension CoffeeListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeDataSource.getNumberOfCoffees()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell") as? CoffeeTableViewCell else{
            return UITableViewCell()
        }
        
        if let coffee = coffeeDataSource.getCoffee(for: indexPath.row){
            cell.coffeeImageView.image = UIImage(named: coffee.imageName)
            cell.coffeeNameLabel.text = coffee.coffeeName
            cell.coffeePriceLabel.text = coffee.price
        } else {
            cell.coffeeImageView.image = nil
            cell.coffeeNameLabel.text = ""
            cell.coffeePriceLabel.text = ""
        }
        
        return cell
    }
    
    
}
