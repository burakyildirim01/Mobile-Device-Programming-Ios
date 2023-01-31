//
//  PharmacyDetailViewController.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import UIKit

class PharmacyDetailViewController: UIViewController {
    
    @IBOutlet weak var pharmNameLabel: UILabel!
    
    @IBOutlet weak var pharmAddressLabel: UILabel!
    
    @IBOutlet weak var pharmPhoneLabel: UILabel!
    
    var pharmacyIdentifier: String?
    
    let pharmacyDataSource = PharmacyDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        pharmacyDataSource.delegate = self
        if let pharmacyIdentifier = pharmacyIdentifier{
            pharmacyDataSource.getPharmacy(with: pharmacyIdentifier)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pharmNameLabel.text = "N/A"
        pharmAddressLabel.text = "N/A"
        pharmPhoneLabel.text = "N/A"
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

extension PharmacyDetailViewController: PharmacyDataDelegate{
    func pharmacyDetailLoaded(pharmacy: PharmacyDetails) {
        pharmNameLabel.text = pharmacy.Name
        pharmAddressLabel.text = pharmacy.Address
        pharmPhoneLabel.text = pharmacy.Phone
        self.title = pharmacy.Name
    }
}
