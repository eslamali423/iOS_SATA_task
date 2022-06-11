//
//  CategoryVIewModel.swift
//  Task
//
//  Created by Eslam Ali  on 10/06/2022.
//

import Foundation

class ViewModel {
    
    var categories : [Category] = []
    var sliders : [Slider] = []
    var newoffers : [Offer] = []
    
    
    var api : APIResponse?
    
    func getData (completion : @escaping (Bool)->Void)  {
        BaseDataAPI.shared.getData {  [weak self](restlt) in
            switch restlt {
            case .success(let response):
                self?.categories = response!.categories
                self?.sliders = response!.sliders
                self?.newoffers = response!.newoffers
                completion(true)
    
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
            
            
        }
    }
    
    
    
    
    
    
}
