//
//  TransactionView.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import SwiftUI

struct TransactionView: View {
    //set up various values for use in stack
    @State var name :String
    @State var amount: Double
    @State var additionalInfo: String
    @State var type: TransactionType
    
    @StateObject var trlg: TransactionLog
    
    //update the background colors when looking at expenses or income
    private var transactionColor: Color {
        get{
            if type == .income {
                return .green
            } else {
                return .red
            }
        }
    }
    
    //set up the stack
    var body: some View {
        VStack (spacing:30){
            HStack(alignment: .firstTextBaseline, spacing: 20){
                Text(String(amount))
                Text(name)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(transactionColor)
            .bold()
            .font(.system(size:20))
            .kerning(2)
            .multilineTextAlignment(.center)
            
            VStack{
                ScrollView{
                    Text(additionalInfo)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                }
            }
            .padding()
            .frame(height:150)
            .safeAreaInset(edge: .bottom){
                ZStack{
                    Text("Scroll to read more")
                        .foregroundColor(.brown)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .foregroundColor(.orange.opacity(0.6))
                }
            }
            ScrollView{
                //segue to AddTransaction
                NavigationLink(destination: AddTransactionView(validAmount: true, trlg: trlg)){
                    Image(systemName: "arrow.right")
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
    //no longer needed, was used for testing
    //TransactionView(name: "simon's gift", amount: 45.00, additionalInfo: "simon is a super smart and dedicated man who is onelt dumb sometimes", type: .income)
}
