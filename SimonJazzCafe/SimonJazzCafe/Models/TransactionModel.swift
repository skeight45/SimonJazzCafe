//
//  TransactionModel.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import Foundation


struct TransactionModel: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var amount: Double
    var additionalInfo: String
}
