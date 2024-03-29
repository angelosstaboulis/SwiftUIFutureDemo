//
//  ViewModelProduct.swift
//  SwiftUIFutureDemo
//
//  Created by Angelos Staboulis on 30/3/24.
//

import Foundation
class ViewModelProduct:ObservableObject{
    var apimanager:APIManager
    init(apimanager: APIManager) {
        self.apimanager = apimanager
    }
    func getAllProducts() async -> [Product]{
        do{
            return  try await self.apimanager.fetchProducts().async()
        }catch{
            return []
        }
    }
}
