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
   
    @IBOutlet weak var tblProductTableView: UITableView!
    
    private var productsPresenter : ProductsListPresenter?
    var productsList : [ProductModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Products"
        
        self.tblProductTableView.delegate = self
        self.tblProductTableView.dataSource = self
        
        productsPresenter = ProductsListPresenter(service: ProductsDataSource(), delegate: self)
        
        productsPresenter?.obtainProductList()
    }
    
    func displayProducts(products: [ProductModel]) {
        self.productsList = products
        
        self.tblProductTableView.reloadData()
    }
    
}

extension ProductsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "TransactionsList", bundle: nil)
        
        let vc : TransactionListViewController = storyboard.instantiateViewController(identifier: "TransactionListViewControllerId")
        vc.productName = self.productsList?[indexPath.row].productName
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.productsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "productCell")
        
        cell.textLabel?.text = self.productsList?[indexPath.row].productName
        
        return cell
    }
    
}
