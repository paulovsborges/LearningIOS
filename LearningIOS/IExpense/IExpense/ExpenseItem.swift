//
//  ExpenseItem.swift
//  IExpense
//
//  Created by Borges on 26/06/24.
//

import Foundation

struct ExpenseItem : Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}
