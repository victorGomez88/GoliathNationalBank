//
//  TransactionListViewController.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import UIKit

class TransactionListViewController: UIViewController, TransactionsListDelegate {

    @IBOutlet weak var tblTransactionsListTable: UITableView!
    @IBOutlet weak var lblTotalName: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    var transactionsList : [TransactionProductModel]?
    public var productName : String?
    
    private var transactionsPresenter : TransactionsProductPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsPresenter = TransactionsProductPresenter(service: TransactionsProductsDataSource(), delegate: self)
        
        self.title = "Transactions Detail"
        self.lblTotalName.text = "Total:"
        
        self.tblTransactionsListTable.delegate = self;
        self.tblTransactionsListTable.dataSource = self;
        
        transactionsPresenter?.obtainTransactionsList(product: self.productName ?? "")
        
    }
    
    func displayTransactions(transactions: [TransactionProductModel]) {
        self.transactionsList = transactions
        
        self.tblTransactionsListTable.reloadData()
    }
    
    func obtainTotalTransactions(total: Double) {
        self.lblTotalAmount.text = String(format: "%.2f",total)
    }
}

extension TransactionListViewController: UITableViewDelegate {
    
}

extension TransactionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.transactionsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "transactionCell")
        
        cell.textLabel?.text = String(format: "Transaction Nº%d  -> %.2f",indexPath.row, self.transactionsList?[indexPath.row].amount ?? 0.00)
        
        return cell
    }
    
    
}
