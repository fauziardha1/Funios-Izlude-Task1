//
//  HomeViewController.swift
//  Funios-Izlude-Task-1
//
//  Created by FauziArda on 23/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var HomeScreenPageLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Home Screen"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40 ,weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        
        return label
    }()
    
    lazy var logoutButton : UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        button.addTarget(self, action: #selector(handleLogoutButton), for: .touchUpInside)
        
        return  button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        view.addSubview(HomeScreenPageLabel)
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            HomeScreenPageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            HomeScreenPageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant:  view.bounds.width - 80),
        ])
    }
    
    @objc func handleLogoutButton(){
        self.navigationController?.popViewController(animated: false)
        self.navigationController?.popViewController(animated: false)
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


#if DEBUG
import SwiftUI
struct HomeViewController_Preview : PreviewProvider {
    static var previews: some View{
        ViewControllerPreview {
            HomeViewController()
        }
    }
}

#endif
