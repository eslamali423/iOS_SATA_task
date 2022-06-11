//
//  SlidersCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit
import SDWebImage

class SlidersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SlidersCollectionViewCell"

    private let offertImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 60
      
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
    
    //MARK:- Layouts and Constraints
    private func setupLayouts(){
        contentView.addSubview(offertImageView)

    }
    
    private func configureConstraints(){
      
        NSLayoutConstraint.activate([
        
            offertImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40),
            offertImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -40),
            offertImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            offertImageView.heightAnchor.constraint(equalToConstant: 150),

        ])
   
    }

    //MARK:- Cell Configration with Model
    func configureCell(model : Slider){
        
        DispatchQueue.main.async { [weak self] in
            let url = URL(string: "\(Constants.baseUrl)\(model.photo)")
            self?.offertImageView.sd_setImage(with: url, completed: nil)
            
        }
        
        
        
    }
    

    
}
