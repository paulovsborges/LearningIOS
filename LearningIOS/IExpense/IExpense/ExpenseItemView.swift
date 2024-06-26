//
//  ExpenseItemView.swift
//  IExpense
//
//  Created by Borges on 26/06/24.
//

import SwiftUI

struct ExpenseItemView: View {
    
    let name: String
    let type: ExpenseType
    let amount: Double
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(name).font(.headline)
                Text("\(type)").font(.subheadline)
            }
            Spacer()
            Text(amount, format: .currency(code: getCurrencyCode())).foregroundColor(getExpenseValueColor())
        }
    }
    
    private func getExpenseValueColor() -> Color{
        if amount <= 10 {
            return Color.black
        }
        
        if amount <= 100 {
            return Color.yellow
        }
        
        return Color.red
    }
}

#Preview {
    VStack{
        List{
            
            ExpenseItemView(name: "Testing", type: .Business, amount: 2.0).padding(.all)
            
            ExpenseItemView(name: "Testing", type: .Business, amount: 50.0).padding(.all)
            
            ExpenseItemView(name: "Testing", type: .Personal, amount: 150.0).padding(.all)
        }
    }
}
