//
//  LogModel.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import Foundation

enum TransactionType {
  case income
  case expense
}

class TransactionLog: Identifiable, ObservableObject {
    var id: String = UUID().uuidString
    var type: TransactionType
    
    @Published var nextId: Int = 6
    @Published var transactionList: [TransactionModel]
    
    init(id: String, type: TransactionType, trList: [TransactionModel]){
        self.id = id
        self.type = type
        self.transactionList = trList
    }
    
    func addTransaction(tr: TransactionModel){
        transactionList.append(tr)
        nextId+=1
    }
    
    func sumList() -> Double{
        var total = 0.0
        for transaction: TransactionModel in transactionList {
            total = total + transaction.amount
        }
        return total
    }
}
