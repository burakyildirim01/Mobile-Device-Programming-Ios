//
//  RegionViewController.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import UIKit

class RegionViewController: UIViewController {
    
    
    @IBOutlet weak var regionListTableView: UITableView!
    
    private let regionDataSource = RegionDataSource()
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regionDataSource.delegate = self
        if let city = city {
            regionDataSource.getListOfRegions(with: city.Id)
            self.title = city.Name
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = regionListTableView.indexPathForSelectedRow {
            regionListTableView.deselectRow(at: selectedIndexPath, animated: animated)
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
           let indexPath = regionListTableView.indexPath(for: cell),
           let region = regionDataSource.getRegion(for: indexPath.row),
           let pharmacyController = segue.destination as? PharmacyViewController {
            pharmacyController.region = region
        }
    }

}

extension RegionViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionDataSource.getNumberOfRegions()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell") as? RegionTableViewCell else{
            return UITableViewCell()
        }
        
        if let region = regionDataSource.getRegion(for: indexPath.row){
            cell.regionNameLabel.text = region.Name
        } else {
            cell.regionNameLabel.text = ""
        }
        
        return cell
    }
    
    
}

extension RegionViewController: RegionDataDelegate{
    func regionListLoaded() {
        self.regionListTableView.reloadData()
    }
}
