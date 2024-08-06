//
//  favouritsVC.swift
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class FavouritsVC: UIViewController {

    @IBOutlet weak var favoritsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritsTableView.delegate = self
        favoritsTableView.dataSource = self
        favoritsTableView.separatorStyle = .none
        favoritsTableView.register(UINib(nibName: "favoritsTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritsTableViewCell")
        
    }

}
extension FavouritsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoritsTableView.dequeueReusableCell(withIdentifier: "favoritsTableViewCell", for: indexPath) as? favoritsTableViewCell else {
            return favoritsTableViewCell()
        }
            cell.favLabelName.text = "Mahmoudefefefefee"
            cell.favAccLabel.text = "Account xxxx7890"
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    }
    
    

