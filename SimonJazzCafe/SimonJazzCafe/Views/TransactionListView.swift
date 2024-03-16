//
//  TransactionListView.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import SwiftUI

struct TransactionListView: View {
    //bring in dataset
    @ObservedObject var trlg: TransactionLog
    
    //setup a switchfor income/expense displays
    private var title: String {
        get{
            if trlg.type == .income {
                return "Income"
            } else {
                return "Expenses"
            }
        }
    }
    //setup stack
    var body: some View {
        List{
            ForEach(trlg.transactionList){tr in
                VStack{
                    TransactionView(name: tr.name, amount: tr.amount, additionalInfo: tr.additionalInfo, type: trlg.type, trlg: trlg)
                }
            }
        }
        .listStyle(PlainListStyle())
        .frame(maxWidth: .infinity)
        //use navigation bad for status
        .navigationTitle("Total \(title): $\(String(format: "%.2f", trlg.sumList()))")
        .navigationBarItems(
            //segue to add transaction
            trailing: NavigationLink("Add", destination: AddTransactionView(validAmount: true, trlg: trlg))
        )
    }
}

#Preview {
    ContentView()
    //var temp = TransactionLog(id: "1", type: .income, trList: incomeSources)
    //TransactionListView(trlg: temp)
}
