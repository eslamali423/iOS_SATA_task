//
//  CollectionViewTableViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"

    
    
       private let titleLabel : UILabel = {
           let label =  UILabel()
           label.numberOfLines = 1
           label.textColor = .black
           label.textAlignment = .right
           label.font = UIFont(name: "Cairo-Bold", size: 16)
           label.adjustsFontSizeToFitWidth = true
           return label
       }()
       
       public let collectionView : UICollectionView = {
           // Layout
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.itemSize = CGSize(width: 80, height: 100)
           
           
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.semanticContentAttribute = .forceRightToLeft
           collectionView.backgroundColor = .systemBackground
           collectionView.showsHorizontalScrollIndicator = false
           return collectionView
       }()
       
       //MARK:- Life Cycle
       override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
          
           contentView.addSubview(collectionView)
           contentView.addSubview(titleLabel)
           
         
       
           collectionView.delegate = self
           collectionView.dataSource = self
       }
       
       required init?(coder: NSCoder) {
           fatalError()
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           
           titleLabel.frame = CGRect(x: -10, y: 10, width: bounds.width, height: 20)
           collectionView.frame = CGRect(x: 0, y: titleLabel.frame.height + 5
                                         , width: bounds.width - 10, height: bounds.height  )
           
    
       }
       

    
}


//MARK:- Extension for CollectionView Functions
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                print("can't get category cell")
                return UICollectionViewCell()
            }
        
           // cell.configureCell(model: products[indexPath.row] )
        
        
            return cell
            
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
   
 
    

}

