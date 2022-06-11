//
//  CategoryCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Vars
    
    static let identifier = "CategoryCollectionViewCell"
   
    
    
    private let CategoryImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.image = UIImage(systemName: "person")
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Category Title"
        label.font = UIFont(name: "Cairo-Bold", size: 15)
//        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    //MARK:- Initilizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        setupLayouts()
        ConfigureConstraints()
    }
    

    required init?(coder: NSCoder) {
        fatalError()
    }
  //MARK:- Layouts / Constraints
    private func setupLayouts(){
        
       
        contentView.addSubview(CategoryImageView)
        contentView.addSubview(titleLabel)
       
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.cornerRadius = 5
//        contentView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    
    private func ConfigureConstraints(){
        NSLayoutConstraint.activate([
            
          
            
            
            CategoryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            CategoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            CategoryImageView.widthAnchor.constraint(equalToConstant: 40),
            CategoryImageView.heightAnchor.constraint(equalToConstant: 40),
            


            titleLabel.topAnchor.constraint(equalTo: CategoryImageView.bottomAnchor,constant: 1),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

        ])
    }
    
    //MARK:- Cell Configuration with Models
    public func configureCell(model : Category) {
        self.titleLabel.text = model.name
        let url = URL(string: "\(Constants.baseUrl)\(model.photo)")
        self.CategoryImageView.sd_setImage(with: url, completed: nil)
        
        
    }
    
  
    
    
    
}
