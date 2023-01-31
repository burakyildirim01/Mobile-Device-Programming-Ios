//
//  PharmacyViewController.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import UIKit

class PharmacyViewController: UIViewController {
    
    @IBOutlet weak var pharmacyListTableView: UITableView!
    
    private let pharmacyDataSource = PharmacyDataSource()
    
    var region: Region?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pharmacyDataSource.delegate = self
        if let region = region {
            pharmacyDataSource.getListOfPharmacies(with: region.Id)
            self.title = region.Name
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = pharmacyListTableView.indexPathForSelectedRow {
            pharmacyListTableView.deselectRow(at: selectedIndexPath, animated: animated)
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
           let indexPath = pharmacyListTableView.indexPath(for: cell),
           let pharmacy = pharmacyDataSource.getPharmacy(for: indexPath.row),
           let pharmacyDetailController = segue.destination as? PharmacyDetailViewController {
            pharmacyDetailController.pharmacyIdentifier = pharmacy.Id
        }
    }

}

extension PharmacyViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfPharmacies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell") as? PharmacyTableViewCell else{
            return UITableViewCell()
        }
        
        if let pharmacy = pharmacyDataSource.getPharmacy(for: indexPath.row){
            cell.pharmacyNameLabel.text = pharmacy.Name
        } else {
            cell.pharmacyNameLabel.text = ""
        }
        
        return cell
    }
    
    
}

extension PharmacyViewController: PharmacyDataDelegate{
    
    func pharmacyListLoaded() {
        self.pharmacyListTableView.reloadData()
    }
}
