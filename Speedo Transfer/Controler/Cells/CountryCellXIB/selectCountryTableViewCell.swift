//
//  selectCountryCell.swift
//  FinalProjectBM
//
//  Created by Abdelrahman Amer on 01/08/2024.
//

import Foundation
import UIKit

class selectCountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var isSelectedIcon: UIImageView!
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initial setup
           background.backgroundColor = UIColor.white
           isSelectedIcon.isHidden = true
       }
}
