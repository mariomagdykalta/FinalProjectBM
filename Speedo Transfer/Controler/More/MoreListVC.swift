//
//  ViewController.swift
//  moreee
//
//  Created by groub G  on 05/08/2024.
//
//
import UIKit

class MoreListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!

    struct Icons {
        let title: String
        let imageName: String
    }
    
    let data: [Icons] = [
        Icons(title: "Transaction From Website", imageName: "1A"),
        Icons(title: "Favourite", imageName: "2B"),
        Icons(title: "Profile", imageName: "6M"),
        Icons(title: "Help", imageName: "4D"),
        Icons(title: "Logout", imageName: "5E")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        customBackground()

        // Tab bar
        let tabBarHeight: CGFloat = 73
        let itemWidth: CGFloat = 304 / 5
        
        let safeAreaInsets = view.safeAreaInsets
        let customTabBar = CustomTabBar(frame: CGRect(x: 0, y: view.frame.height - tabBarHeight - safeAreaInsets.bottom, width: view.frame.width, height: tabBarHeight))
        customTabBar.layer.cornerRadius = 25
        customTabBar.clipsToBounds = true
        
        view.addSubview(customTabBar)
    }
    
    class CustomTabBar: UIView {
        
        weak var viewController: UIViewController?
        
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
                imageView.frame = CGRect(x: (itemWidth - 24) / 2, y: 8, width: 24, height: 20)
                button.addSubview(imageView)
                
                let titleLabel = UILabel(frame: CGRect(x: 0, y: 32, width: itemWidth, height: 21))
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
            guard let viewController = viewController else { return }
            
            switch sender.tag {
            case 1:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let favoriteVC = storyboard.instantiateViewController(withIdentifier: "FavoritViewC") as? FavoritViewC {
                    viewController.navigationController?.pushViewController(favoriteVC, animated: true)
                }
            case 2:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC {
                    viewController.navigationController?.pushViewController(profileVC, animated: true)
                }
            case 3:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let helpVC = storyboard.instantiateViewController(withIdentifier: "HelpVC") as? HelpVC {
                    viewController.navigationController?.pushViewController(helpVC, animated: true)
                }
            default:
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icons = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = icons.title
        cell.iconImageView.image = UIImage(named: icons.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBAction func btnTapp(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! SignUpFirstVC
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    func customBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor(red: 1.0, green: 0.90, blue: 0.93, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

//import UIKit
//
//class MoreListVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
//
//    @IBOutlet weak var table: UITableView!
//
//
//
//    struct Icons {
//        let title: String
//        let imageName: String
//    }
//    let data : [Icons] = [
//        Icons(title: "Transaction From Website", imageName: "1A"),
//        Icons(title: "Favourite", imageName: "2B"),
//        Icons(title: "Profile", imageName: "6M"),
//        Icons(title: "Help", imageName: "4D"),
//        Icons(title: "Logout", imageName: "5E")
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        table.dataSource = self
//        table.delegate = self
//        customBackground()
//
//        //tabbar
//        let tabBarHeight: CGFloat = 73// Set height as specified
//                        let itemWidth: CGFloat = 304 / 5 // Total width divided by the number of items
//
//                        let safeAreaInsets = view.safeAreaInsets
//                        let customTabBar = CustomTabBar(frame: CGRect(x: 0, y: view.frame.height - tabBarHeight - safeAreaInsets.bottom - 0, width: view.frame.width, height: tabBarHeight))
//                        customTabBar.layer.cornerRadius = 25 // Adjust corner radius as needed
//                        customTabBar.clipsToBounds = true
//
//                        view.addSubview(customTabBar)
//                // Do any additional setup after loading the view.
//
//
//    }
//    //tabbarrr
//    class CustomTabBar: UIView {
//
//           override init(frame: CGRect) {
//               super.init(frame: frame)
//               setupViews()
//           }
//
//           required init?(coder: NSCoder) {
//               super.init(coder: coder)
//               setupViews()
//           }
//
//           private func setupViews() {
//               backgroundColor = .clear
//
//               let items = [
//                   ("Home", "Home"),
//                   ("Transfer", "Transfer"),
//                   ("Transactions", "Transactions"),
//                   ("My Cards", "Cards"),
//                   ("More", "More")
//               ]
//
//               let itemWidth = frame.width / CGFloat(items.count)
//               let itemHeight: CGFloat = frame.height
//
//
//               for (index, item) in items.enumerated() {
//                   let button = UIButton(frame: CGRect(x: CGFloat(index) * itemWidth, y: 0, width: itemWidth, height: itemHeight))
//                   button.backgroundColor = .white
//                   button.layer.cornerRadius = 0
//                   button.layer.masksToBounds = true
//
//
//                   let imageView = UIImageView(image: UIImage(named: item.1))
//                   imageView.contentMode = .scaleAspectFit
//                   imageView.frame = CGRect(x: (itemWidth - 24) / 2, y: 8, width: 24, height: 20) // Adjust image size and position
//                   button.addSubview(imageView)
//
//                   let titleLabel = UILabel(frame: CGRect(x: 0, y: 32, width: itemWidth, height: 21)) // Adjust title position and size
//                   titleLabel.text = item.0
//                   titleLabel.textAlignment = .center
//                   titleLabel.font = UIFont.systemFont(ofSize: 12)
//                   titleLabel.textColor = .black
//                   button.addSubview(titleLabel)
//
//                   button.tag = index
//                   button.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
//
//                   addSubview(button)
//               }
//           }
//
//           @objc private func tabBarButtonTapped(_ sender: UIButton) {
//               print("Tab bar item \(sender.tag) tapped")
//
//           }
//       }
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let icons = data[indexPath.row]
//        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
//        cell.label.text = icons.title
//        cell.iconImageView.image = UIImage(named: icons.imageName)
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
//
//    @IBAction func btnTapp(_ sender: Any) {
//        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! SignUpFirstVC
//        self.navigationController?.pushViewController(storyboard, animated: true)
//    }
//    func customBackground(){
//            let gradientLayer = CAGradientLayer()
//            gradientLayer.frame = self.view.bounds
//            gradientLayer.colors = [UIColor.white.cgColor, UIColor(red: 1.0, green: 0.90, blue: 0.93, alpha: 1.0).cgColor]
//            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
//            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
//
//            self.view.layer.insertSublayer(gradientLayer, at: 0)
//        }
//
//
//}
//
