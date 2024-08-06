//
//  FirstTableViewCell.swift
//  Notifications
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ReciveCellView: UIView!
    
    
    @IBOutlet weak var ReciveTransactionLabel: UILabel!
    
    @IBOutlet weak var TheReciveLabel: UILabel!
    
    
    @IBOutlet weak var DataLabel: UILabel!
    
    
    @IBOutlet weak var RecivedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Customize shadow for the view
        ReciveCellView.layer.shadowColor = UIColor(named: "Shadow"
                )?.cgColor
        ReciveCellView.layer.shadowOpacity = 0.1
        ReciveCellView.layer.shadowOffset = CGSize(width: 0, height: 4)
        //        sendEmailView.layer.shadowRadius = 4
        //        sendEmailView.layer.masksToBounds = false
                
            }
        
    }
    

    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    

