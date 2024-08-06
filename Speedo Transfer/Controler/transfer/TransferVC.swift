//
//  transferAmountVC.swift
//
//
//  Created by groub G  on 05/08/2024.
//

import UIKit
import FittedSheets

class TransferVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func favoriteBtnTapped(_ sender: Any) {
        guard let countrySheet = storyboard?.instantiateViewController(withIdentifier: "favouritsVC") as? FavouritsVC else {
            print("Could not instantiate favouritsVC")
            return
        }
        
        let sheetController = SheetViewController(controller: countrySheet, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius=50
        sheetController.gripColor=UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    

}
