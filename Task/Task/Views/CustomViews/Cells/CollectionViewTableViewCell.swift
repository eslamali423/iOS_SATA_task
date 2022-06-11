//
//  CollectionViewTableViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    //MARK:- Vars
    static let identifier = "CollectionViewTableViewCell"
    
    public var selectedIndex = 0
    
    var categories : [Category] = []
    var sliders : [Slider] = []
    var newoffers : [Offer] = []
    var tabelViewIndexPath : IndexPath?
    
    enum data {
        
    }
    
    
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .right
        
        label.font = UIFont(name: "Cairo-Bold", size: 18)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 100)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(OffersCollectionViewCell.self,
                                forCellWithReuseIdentifier: OffersCollectionViewCell.identifier)
        collectionView.register(SlidersCollectionViewCell.self,
                                forCellWithReuseIdentifier: SlidersCollectionViewCell.identifier)
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
        
        titleLabel.frame = CGRect(x: -20, y: 10, width: bounds.width, height: 20)
        collectionView.frame = CGRect(x: 0, y: titleLabel.frame.height
                                      , width: bounds.width - 10, height: bounds.height  )
        
        
    }
    //MARK:- Cell Configuration with Model
    func configure(categories: [Category], sliders: [Slider] , offers : [Offer] , TindexPath : IndexPath) {
        self.categories = categories
        self.sliders = sliders
        self.newoffers = offers
        self.tabelViewIndexPath = TindexPath
        
        DispatchQueue.main.async { [weak self] in
            if TindexPath.section == 0 {
                self?.titleLabel.text =  "اختر نوع الاكل المفضل لديك"
            }else if TindexPath.section == 1 {
                self?.titleLabel.text = ""
            }else if TindexPath.section == 2 {
                self?.titleLabel.text = "تصفح أقوى العروض عندنا "
            }
            self?.collectionView.reloadData()
        }
    }
    
}


//MARK:- Extension for CollectionView Functions
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if tabelViewIndexPath?.section == 0 {
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(model: categories[indexPath.row])
            return cell
        } else if tabelViewIndexPath?.section == 1 {
            
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: SlidersCollectionViewCell.identifier, for: indexPath) as? SlidersCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(model: sliders[indexPath.row])
            return cell
        } else if tabelViewIndexPath?.section == 2 {
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.identifier, for: indexPath) as? OffersCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(model: newoffers[indexPath.row])
            return cell
            
        }else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if tabelViewIndexPath?.section == 0 {
            return self.categories.count
        }else if tabelViewIndexPath?.section == 1 {
            return self.sliders.count
        }else if tabelViewIndexPath?.section == 2 {
            return self.newoffers.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if tabelViewIndexPath?.section == 0 {
            return CGSize(width: 80, height:100 )
        }else if tabelViewIndexPath?.section == 1 {
            return CGSize(width: 400, height: 250 )
        }else if tabelViewIndexPath?.section == 2 {
            return CGSize(width: 200, height:100 )
        }
        
        return CGSize(width: 200, height:120 )
    }
}


