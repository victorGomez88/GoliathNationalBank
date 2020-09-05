//
//  ProductsViewController.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import UIKit

class ProductsViewController: UIViewController, ProductsViewDelegate {
    
    private var productsPresenter : ProductsListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsPresenter = ProductsListPresenter(service: GNBServices(), delegate: self)
    
        productsPresenter?.obtainProductList()
    }
    
    func displayProducts() {
       
    }

}
