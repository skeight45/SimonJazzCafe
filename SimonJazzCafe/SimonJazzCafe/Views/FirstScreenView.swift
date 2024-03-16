//
//  FirstScreenView.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import SwiftUI

struct FirstScreenView: View {
    //pul in income and expense
    var income: TransactionLog
    var expense: TransactionLog
    
    //a few computed variabled to help with the overview
    var overviewColor: Color{
        get{
            if overviewValue > 0 {
                return .green
            } else if overviewValue < 0 {
                return .red
            } else {
                return .blue
            }
        }
    }
    var overviewValue: Double{
        get{
            return getProfitLoss()
        }
    }
    
    var body: some View {
        
        VStack {
            Text(getProfitLossText())
                .foregroundColor(overviewColor)
                .bold()
                .font(.system(size:30))
                .padding()
            ASyncImageView(urlString: urlCoffee)
                .padding()
            ASyncImageView(urlString: urlFood)
            ASyncImageView(urlString: urlLatte)
                .padding()
            //segue to income list
            NavigationLink(destination: TransactionListView(trlg: income)){
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.green)
                    Text("View and Modify Income")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            //segue to expense list
            NavigationLink(destination: TransactionListView(trlg: expense)){
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                    Text("View and Modify Expenses")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            .navigationTitle("Overview")
        }
    }
    
    //pull the text for under the overview
    func getProfitLossText() -> String{
        let outlook: String
        if overviewValue >= 0 {
            outlook = "Profit"
        } else {
            outlook = "Loss"
        }
        let formattedValue = String(format: "%.2f", overviewValue)
        return formattedValue+"% "+outlook
    }
    
    //pull the overview values
    func getProfitLoss() -> Double{
        let totalIncome: Double = income.sumList()
        let profitLoss: Double = 100.0 * (totalIncome - expense.sumList())/totalIncome
        return profitLoss
    }
    
    }
    //using insructors ASyncImageView with some slight modifications
    struct ASyncImageView: View{
        var urlString: String
        
        var body: some View{
            AsyncImage(url: URL(string: urlString)){phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage): returnedImage
                        .frame(width: 350,height: 125)
                        .scaledToFit()
                        .cornerRadius(20)
                case .failure:
                    Image(systemName: "questionmark")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                    
                }
            }
        }
    }


#Preview {
    ContentView()
    //Previously used for testing
    //var temp = TransactionLog(id: "1", type: .income, trList: incomeSources)
    //var temp2 = TransactionLog(id: "2", type: .expense, trList: expenseSources)
    //FirstScreenView(income: temp, expense: temp2)
}
