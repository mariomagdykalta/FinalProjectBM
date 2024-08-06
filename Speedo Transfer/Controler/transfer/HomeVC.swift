//
//  HomeVC.swift

//  Created by groub G  on 05/08/2024.
//


import UIKit

class HomeVC: UIViewController {

    var hiddenFlag:Bool = true
    
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var hiddenBalanceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        let tabBarHeight: CGFloat = 73// Set height as specified
                        let itemWidth: CGFloat = 304 / 5 // Total width divided by the number of items
                
                        let safeAreaInsets = view.safeAreaInsets
                        let customTabBar = CustomTabBar(frame: CGRect(x: 0, y: view.frame.height - tabBarHeight - safeAreaInsets.bottom - 0, width: view.frame.width, height: tabBarHeight))
                        customTabBar.layer.cornerRadius = 25 // Adjust corner radius as needed
                        customTabBar.clipsToBounds = true
                
                        view.addSubview(customTabBar)
        
                // Do any additional setup after loading the view.

        hiddenBalanceButton.layer.cornerRadius
        hiddenBalanceButton.frame.width/2
        hiddenBalanceButton.layer.masksToBounds = true
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.allowsSelection = false
        homeTableView.isScrollEnabled = false
    }
    
    @IBAction func hiddenBalanceBTN(_ sender: Any) {
        
        //        let moneyLabelblur = BlurredLabel()
        //        moneyLabelblur.text = moneyLabel.text
        //        moneyLabelblur.frame = moneyLabel.bounds
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        
        blurView.frame = balanceLabel.bounds
        blurView.layer.cornerRadius = 15
        blurView.layer.masksToBounds = true
        
        if hiddenFlag == true {
            
            balanceLabel.addSubview(blurView)
            // blurView = UIVisualEffectView(effect: blur)
            // moneyLabel.addSubview(blurView)
            
            //            moneyLabelblur.blur()
            //            moneyLabel.addSubview(moneyLabelblur)
            
            hiddenBalanceButton.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
            
            hiddenFlag = false
        } else {
            
            for view in self.balanceLabel.subviews {
                view.removeFromSuperview()
            }
            
            //            moneyLabelblur.unblur()
            //            moneyLabel.willRemoveSubview(moneyLabelblur)
            
            hiddenBalanceButton.setImage(UIImage.init(systemName: "eye"), for: .normal)
            
            hiddenFlag = true
        }
        
    }
    
}



extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
