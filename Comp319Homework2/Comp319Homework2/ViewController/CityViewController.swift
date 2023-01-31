//
//  CityViewController.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import UIKit

class CityViewController: UIViewController {
    
    
    @IBOutlet weak var cityListTableView: UITableView!
    
    private let cityDataSource = CityDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityDataSource.delegate = self
        cityDataSource.getListOfCities()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = cityListTableView.indexPathForSelectedRow {
            cityListTableView.deselectRow(at: selectedIndexPath, animated: animated)
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
           let indexPath = cityListTableView.indexPath(for: cell),
           let city = cityDataSource.getCity(for: indexPath.row),
           let regionController = segue.destination as? RegionViewController {
            regionController.city = city
        }
    }

}
extension CityViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDataSource.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityTableViewCell else{
            return UITableViewCell()
        }
        
        if let city = cityDataSource.getCity(for: indexPath.row){
            cell.cityNameLabel.text = city.Name
        } else {
            cell.cityNameLabel.text = ""
        }
        
        return cell
    }
    
    
}

extension CityViewController: CityDataDelegate{
    func cityListLoaded() {
        self.cityListTableView.reloadData()
    }
    
    
}
