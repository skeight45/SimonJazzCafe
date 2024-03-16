//
//  TransactionListModel.swift
//  SimonJazzCafe
//
//  Created by Keightley, Simon on 3/16/24.
//

import Foundation

var incomeSources: [TransactionModel] = [
    TransactionModel(id: "1", name: "Food sales", amount: 1500.95, additionalInfo: "This is the combined number of all food sales at the cafe. It is not split up."),
    TransactionModel(id: "2", name: "Coffee ground sales", amount: 999.98, additionalInfo: "This is the money coming in from sales of our coffee grounds."),
    TransactionModel(id: "3", name: "Espresso sales", amount: 1897.45, additionalInfo: "This is the money coming in from espresso purchaes."),
    TransactionModel(id: "4", name: "Latte sales", amount: 3642.90, additionalInfo: "This is the money coming in from Lattes, very popular."),
    TransactionModel(id: "5", name: "Sponsorships", amount: 500.00, additionalInfo: "This is the the money we get from loca sponsorships")
]
                    
var expenseSources: [TransactionModel] = [
    TransactionModel(id: "1", name: "Utilities", amount: 250.67, additionalInfo: "Cost of utilities including water, internet, and electricity"),
    TransactionModel(id: "2", name: "Rent", amount: 670.00, additionalInfo: "Cost to rent the space. It always seems to be going up."),
    TransactionModel(id: "3", name: "Food cost", amount: 650.98, additionalInfo: "Cost of food not including labor."),
    TransactionModel(id: "4", name: "Staffing", amount: 3200.00, additionalInfo: "The cost to keep up open 40 hours a week."),
    TransactionModel(id: "5", name: "Donations", amount: 100.00, additionalInfo: "We give some money to the local halfway house when we can.")
]

var urlCoffee: String = "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg"
var urlJazzCafe: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoTG11KQqTzLzzJ84-13zQC2RyMm_HyiGzew&usqp=CAU"
var urlFood: String = "https://img.bestrecipes.com.au/NJJU-8R3/w643-h428-cfill-q90/br/2019/05/pumpkin-pancakes-951968-1.jpg"
var urlLatte: String = "https://images.cnbctv18.com/wp-content/uploads/2022/10/coffee-1019x573.jpg"
