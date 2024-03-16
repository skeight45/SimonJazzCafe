//
//  AddTransactionView.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import SwiftUI

struct AddTransactionView: View {
    //set up initial modifiable variables
    @State var tfName: String = ""
    @State var tfAmount: String = ""
    @State var tfAddlInfo: String = ""
    @State var validAmount: Bool
    //bring in dataset
    @ObservedObject var trlg: TransactionLog
    
    //series of functions to update values as things change
    private var title: String {
        get{
            if trlg.type == .income {
                return "Income"
            } else {
                return "Expense"
            }
        }
    }
    private var transactionColor: Color {
        get{
            if trlg.type == .income {
                return .green
            } else {
                return .red
            }
        }
    }
    private var warning: String{
        get{
            if validAmount {
                return ""
            } else {
                return " - INVALID AMOUNT"
            }
            
        }
    }
    
    //settings up the stack
    var body: some View {
        VStack{
            VStack{
                Text("\(title)")
                    .font(.system(size: 28))
                    .bold()
                    .kerning(2)
                
                TextField("Enter name...", text:$tfName)
                    .padding()
                    .background(Color.gray.opacity(0.3)
                        .cornerRadius(10))
                    .frame(width: 200)
            }
            VStack{
                Text("Amount \(warning)")
                    .font(.system(size: 28))
                    .bold()
                    .kerning(2)
                
                TextField("Enter amount...", text:$tfAmount)
                    .padding()
                    .background(Color.gray.opacity(0.3)
                        .cornerRadius(10))
                    .frame(width: 250)
            }
            VStack{
                Text("Additional Info")
                    .font(.system(size: 28))
                    .bold()
                    .kerning(2)
                
                TextField("Enter any additional information...", text:$tfAddlInfo)
                    .padding()
                    .background(Color.gray.opacity(0.3)
                        .cornerRadius(10))
                    .frame(width: 400)
            }
            Button{
                saveTransaction()
            }label:{
                Text("Save Information")
                    .textCase(.uppercase)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .bold()
                    .background(Color.yellow.opacity(1)
                        .cornerRadius(10))
                
            }
            .navigationTitle("Add New \(title)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(transactionColor.opacity(0.5))
        }
    }
    
    //save a transaction to the corresponding log
    func saveTransaction(){
        guard let doubAmount = Double(tfAmount) else {
            validAmount = false
            return
        }
        validAmount = true
        let newTransaction = TransactionModel(id: String(trlg.nextId), name: tfName, amount: doubAmount, additionalInfo: tfAddlInfo)
        trlg.addTransaction(tr: newTransaction)
        tfName = ""
        tfAmount = ""
        tfAddlInfo = ""
    }
}

#Preview{
    ContentView()
    //no longer needed
    //var temp = TransactionLog(id: "1", type: .income, trList: incomeSources)
    //AddTransactionView(trlg: temp)
}
