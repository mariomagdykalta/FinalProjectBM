//
//  TheNotificationsViewController.swift
//  Notifications
//
//  Created by groub G  on 05/08/2024.
//

import UIKit

class TheNotificationsViewController: UIViewController {
    
    
    @IBOutlet weak var NotificationsTableView: UITableView!
    let FirstTableViewCell: String = "FirstTableViewCell"
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        // Set the background color
        setGradientBackground()
        
        NotificationsTableView.backgroundColor = UIColor.clear
        NotificationsTableView.delegate = self
        NotificationsTableView.dataSource = self
        NotificationsTableView.register(UINib(nibName: FirstTableViewCell, bundle: nil), forCellReuseIdentifier: FirstTableViewCell)
        
        // Create and add custom tab bar
        let tabBarHeight: CGFloat = 73// Set height
        let _: CGFloat = 304 / 5 // Total width divided by the number of items
        let safeAreaInsets = view.safeAreaInsets
        let customTabBar = CustomTabBar(frame: CGRect(x: 0, y: view.frame.height - tabBarHeight - safeAreaInsets.bottom - 0, width: view.frame.width, height: tabBarHeight))
            customTabBar.layer.cornerRadius = 25 // Adjust corner radius as needed
            customTabBar.clipsToBounds = true
                view.addSubview(customTabBar)
           
     }

    // BackgroundColor
    func setGradientBackground() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            
            // Set the gradient colors
            gradientLayer.colors = [
                UIColor(red: 255/255, green: 248/255, blue: 231/255, alpha: 1).cgColor, // Light pink color
                UIColor(red: 255/255, green: 234/255, blue: 238/255, alpha: 1).cgColor  // Slightly darker pink color
            ]
            
            // Set the gradient locations
            gradientLayer.locations = [0.0, 1.0]
            
            // Add the gradient layer to the view's layer
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        }
}

extension TheNotificationsViewController: UITableViewDelegate, UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 10
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell , for: indexPath) as! FirstTableViewCell
                cell.contentView.backgroundColor = UIColor.clear
                
                return cell
            }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 137 // Set the height for the cell
        
    }
    
    // Custom Tab Bar Implementation
    
    class CustomTabBar: UIView {
            
    override init(frame: CGRect) {
                super.init(frame: frame)
                setupViews()
            }
            
            required init?(coder: NSCoder) {
                super.init(coder: coder)
                setupViews()
            }
            
    private func setupViews() {
                backgroundColor = .clear
                
    let items = [
                    ("Home", "Home"),
                    ("Transfer", "Transfer"),
                    ("Transactions", "Transactions"),
                    ("My Cards", "Cards"),
                    ("More", "More")
                ]
                
    let itemWidth = frame.width / CGFloat(items.count)
    let itemHeight: CGFloat = frame.height
                
                
    for (index, item) in items.enumerated() {
    let button = UIButton(frame: CGRect(x: CGFloat(index) * itemWidth, y: 0, width: itemWidth, height: itemHeight))
            button.backgroundColor = .white
            button.layer.cornerRadius = 0
            button.layer.masksToBounds = true
        
                    
    let imageView = UIImageView(image: UIImage(named: item.1))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: (itemWidth - 24) / 2, y: 8, width: 24, height: 20) // Adjust image size and position
            button.addSubview(imageView)
                    
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 32, width: itemWidth, height: 21)) // Adjust title position and size
        titleLabel.text = item.0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = .black
          button.addSubview(titleLabel)
          button.tag = index
          button.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
                    addSubview(button)
                }
            }
            
@objc private func tabBarButtonTapped(_ sender: UIButton) {
                // Handle tab bar item selection
                print("Tab bar item \(sender.tag) tapped")
                // You can use notifications or delegate methods to communicate with the view controller
            }
        }
}
