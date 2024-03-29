//
//  ContentView.swift
//  SwiftUIFutureDemo
//
//  Created by Angelos Staboulis on 29/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var object = ViewModelProduct(apimanager: .init())
    @State var products:[Product] = []
    var body: some View {
        VStack {
            List(products,id:\.self){item in
                Cell(product: item)
            }
        }.task {
            products = await object.getAllProducts()
            debugPrint(products.count)
        }
        
  }
}

#Preview {
    ContentView()
}
