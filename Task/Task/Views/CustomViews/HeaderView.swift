//
//  HeaderView.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit

@available(iOS 13.0, *)

class HeaderView: UIView{

   
    //MARK:- Vars
    private let HeaderImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.image = UIImage(named: "avatar")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
  
    public let welcomeLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .center
        label.text = "اهلا بيك، حسام"
        label.font = UIFont(name: "Cairo-Regular", size: 15)
        return label
    }()
    
    
    private let stackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public let titleLabel1 : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .orange
        label.textAlignment = .center
        label.text = "استمتع"
        label.font = UIFont(name: "Cairo-Bold", size: 18)
        return label
    }()
    
    public let titleLabel2 : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.textAlignment = .center
        label.text = "بأكبر مجموعة من المطاعم والعرض"
        label.font = UIFont(name: "Cairo-Bold", size: 18)
        return label
    }()
    
 
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder =  "قم بالبحث عن طبق أو مطعم"
       // search.font = UIFont(name: "Cairo-SemiBold", size: 18)
        search.layer.borderWidth = 0.2
        search.layer.cornerRadius = 10
        search.semanticContentAttribute = .forceRightToLeft
        search.backgroundColor = .clear
        search.searchTextField.font = UIFont(name: "Cairo-SemiBold", size: 16)
        return search
    }()
   
    
  //MARK:- Initlizaers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        self.clipsToBounds = true
        
       setupLayouts()
        configureConstraints()


    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    
    
    //MARK:- Layouts and Constraints 
    private func setupLayouts(){
        addSubview(HeaderImageView)
        addSubview(welcomeLabel)
        addSubview(searchBar)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel2)
        stackView.addArrangedSubview(titleLabel1)
    
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
        
            HeaderImageView.topAnchor.constraint(equalTo: topAnchor,constant: 18),
            HeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -18),
            HeaderImageView.widthAnchor.constraint(equalToConstant: 60),
            HeaderImageView.heightAnchor.constraint(equalToConstant: 60),
    
            welcomeLabel.topAnchor.constraint(equalTo: HeaderImageView.bottomAnchor,constant: 4),
            welcomeLabel.trailingAnchor.constraint(equalTo: HeaderImageView.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 1),
            stackView.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 1),
            searchBar.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 18),

            searchBar.heightAnchor.constraint(equalToConstant: 50),
     
        ])
    }
    
    
    
}

