//
//  OffersCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit
import SDWebImage

class OffersCollectionViewCell: UICollectionViewCell {
   
    
    //MARK:- Vars
    static let identifier = "OffersCollectionViewCell"
    
    private let offertImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 30
      
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let openNowLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .systemGreen
        label.textAlignment = .left
        label.text = "مفتوح الأن"
        label.font = UIFont(name: "Cairo-Regular", size: 10)
        label.adjustsFontSizeToFitWidth = false
        
        return label
    }()
    
    private let nameLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.text = "Name"
        label.textAlignment = .left
        label.font = UIFont(name: "Cairo-Bold", size: 12)
      //  label.font = .systemFont(ofSize: 12, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    
    
    private let cuisinesLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .label
        label.textAlignment = .left
        label.text = "eslam eslam eslam esalm "
        label.font = UIFont(name: "Cairo-Regular", size: 12)
        label.adjustsFontSizeToFitWidth = false
   //     label.frame = CGRect(x:0,y:0,width:label.intrinsicContentSize.width,height:label.intrinsicContentSize.height)

        return label
    }()
    
    private let describtionLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.text = "aosodkflaskdmflksamdflksmadlfkamslkdfm"
        label.textAlignment = .left
        label.font = UIFont(name: "Cairo-Regular", size: 12)
        label.adjustsFontSizeToFitWidth = false
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.4213576159)
        label.layer.cornerRadius = 10
   //     label.frame = CGRect(x:0,y:0,width:label.intrinsicContentSize.width,height:label.intrinsicContentSize.height)

        return label
    }()
    
    
    //MARK:- Initilizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
        setupLayouts()
        configureConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupLayouts(){
        contentView.addSubview(offertImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(openNowLabel)
        contentView.addSubview(cuisinesLabel)
        contentView.addSubview(describtionLabel)
        
        
    }
    
    private func configureConstraints(){
      
        NSLayoutConstraint.activate([
        
            offertImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            offertImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            offertImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 12),
            offertImageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: offertImageView.bottomAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            
            openNowLabel.topAnchor.constraint(equalTo:offertImageView.bottomAnchor),
            openNowLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            
            cuisinesLabel.topAnchor.constraint(equalTo: openNowLabel.bottomAnchor),
            cuisinesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            cuisinesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            
            
            describtionLabel.topAnchor.constraint(equalTo: cuisinesLabel.bottomAnchor),
            describtionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            describtionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
  
        ])
        
        
    }
    
    
    func configureCell(model : Offer){
        
        DispatchQueue.main.async { [weak self] in
            var x :[Cusin] = []
            let url = URL(string: "\(Constants.baseUrl)\(model.cover)")
            self?.offertImageView.sd_setImage(with: url, completed: nil)
            
            self?.nameLabel.text = model.name
            self?.describtionLabel.text = model.description
            
            self?.cuisinesLabel.text = model.cuisines[0].name
        }
        
        
        
    }
    

    
}
