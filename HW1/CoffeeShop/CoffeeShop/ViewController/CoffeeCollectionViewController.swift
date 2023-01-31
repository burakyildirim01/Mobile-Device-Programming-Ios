//
//  CoffeeCollectionViewController.swift
//  CoffeeShop
//
//  Created by BURAK on 17.11.2022.
//

import UIKit

class CoffeeCollectionViewController: UIViewController {

    @IBOutlet weak var coffeeListCollectionView: UICollectionView!
    
    private let coffeeDataSource = CoffeeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if let cell = sender as? UICollectionViewCell,
           let indexPath = coffeeListCollectionView.indexPath(for: cell),
           let detailController = segue.destination as? CoffeeDetailViewController {
            detailController.coffeeIdentifier = indexPath.row
        }
    }

}
extension CoffeeCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeDataSource.getNumberOfCoffees()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeCollectionCell", for: indexPath) as? CoffeeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let coffee = coffeeDataSource.getCoffee(for: indexPath.row) {
            cell.coffeeImageView.image = UIImage(named: coffee.imageName)
            cell.nameOfCoffeeLabel.text = coffee.coffeeName
        } else {
            cell.coffeeImageView.image = nil
            cell.nameOfCoffeeLabel.text = ""
        }
        return cell
        
    }
    
    
}
