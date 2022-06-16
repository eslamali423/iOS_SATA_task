//
//  HomeViewController.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit

@available(iOS 13.0, *)

class HomeViewController: UIViewController {
    
    //MARK:- Vars
    let orangeColor : UIColor = UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0)
  
    var viewModel = ViewModel()
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        view.addSubview(tableView)
        configureHeaderView()
      
        getData()
     
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
    func configureHeaderView()  {
        let  headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 4))
        tableView.tableHeaderView = headerView

    }
    

    //MARK:- Get Data From ViewModel
    
    func getData(){
        viewModel.getData { (isSuccess) in
            if isSuccess {
                self.tableView.reloadData()
            }
        }
        }

}




//MARK:- Extension for table View Functions
@available(iOS 13.0, *)
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
      
        cell.configure(categories: viewModel.categories, sliders: viewModel.sliders, offers: viewModel.newoffers, TindexPath: indexPath)
        

     return cell
    }
   
    // set the height for section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
            return 0
 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        }else if indexPath.section == 1 {
            return 160
        }else if indexPath.section == 2 {
            return 200
        }else {
            return 0
        }
    }
    

    
    

}
    
