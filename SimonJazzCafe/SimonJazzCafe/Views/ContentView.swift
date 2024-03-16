//
//  ContentView.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    //setup stateobjects to pull from the current transaction logs
    @StateObject var incomeLog = TransactionLog(id: "1", type: .income, trList: incomeSources)
    @StateObject var expenseLog = TransactionLog(id: "2", type: .expense, trList: expenseSources)
    
    //sets up a cozy cafe entrance :)
    var body: some View {
        VStack {
            ScrollView{
                ZStack{
                    NavigationLink(destination: FirstScreenView(income: incomeLog, expense: expenseLog)){
                        ASyncImageView(urlString: urlJazzCafe)
                    }
                    Text("Enter")
                        .foregroundColor(.white)
                }
            }
        }
        .navigationTitle("Simon's Jazz Cafe")
        .padding()
    }
}

#Preview {
    ContentView()
}
