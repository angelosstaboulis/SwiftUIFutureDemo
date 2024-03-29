//
//  APIManager.swift
//  SwiftUIFutureDemo
//
//  Created by Angelos Staboulis on 30/3/24.
//

import Foundation
import PromiseKit
import Alamofire
class APIManager{
    func fetchProducts()->Promise<[Product]>{
        return Promise<[Product]>{ promise in
            do{
                let request = try URLRequest(url: URL(string:"https://fakestoreapi.com/products/")!, method: .get)
                AF.request(request).response { dataResponse in
                    do{
                        if let error = dataResponse.error{
                            promise.reject(error)
                        }
                        let json = try JSONDecoder().decode([Product].self, from: dataResponse.data!)
                        promise.fulfill(json)
                        
                    }catch{
                        debugPrint("something went wrong!!!")
                    }
                }
            }catch{
                debugPrint("something went wrong!!!")
            }
               
            
        }
    }
}
