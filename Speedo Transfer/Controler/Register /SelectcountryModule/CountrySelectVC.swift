//
//  CountrySelectVC.swift
//  FinalProjectBM
//
//  Created by Abdelrahman Amer on 01/08/2024.
//

import UIKit

class CountrySelectVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = true
        let nib = UINib(nibName: "selectCountryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "selectCountryTableViewCell")

    }
    
    let selectedCountryColor = UIColor(red: 243.0/255.0, green: 233.0/255.0, blue: 235.0/255.0, alpha: 1)


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "selectCountryTableViewCell", for: indexPath) as! selectCountryTableViewCell
            cell.countryNameLabel.text = "Country \(indexPath.row)"
            cell.countryImage.image = UIImage(named: "Country 1")
        
            return cell
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? selectCountryTableViewCell
        cell?.background.backgroundColor = selectedCountryColor
        cell?.isSelectedIcon.isHidden = false
    }
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? selectCountryTableViewCell
        cell?.background.backgroundColor = UIColor.white
        cell?.isSelectedIcon.isHidden = true

    }
}
