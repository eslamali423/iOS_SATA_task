//
//  HomeViewController.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- Vars
    let orangeColor : UIColor = UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0)
    
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        view.addSubview(tableView)
        
      
        
       tableView.delegate = self
      tableView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    //MARK:- Configure Navigation Controller Function
    func configureNavBar()  {
        
        
        title = "الرئيسة"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)! ,NSAttributedString.Key.foregroundColor:orangeColor ]
        
        // set the right buton to the navBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: nil)
        
        
        navigationController?.navigationBar.tintColor = orangeColor
    }
    
    
    //MARK:- Customize Header  for the TableView
//    func configureHeaderView(blocks : [Block], image: String)  {
//        let  headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 3), blocks: blocks, image: image)
//        tableView.tableHeaderView = headerView
//
//    }
    
}


//MARK:- Extension for table View Functions
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    

    
    

}
    
