
import SwiftUI

struct AddExpenseView: View {
    
    @State private var name = ""
    @State private var type : ExpenseType = .Personal
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    var expenses : Expenses
    
    private let types = [ExpenseType.Business, ExpenseType.Personal]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text("\($0)")
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: getCurrencyCode())
                ).keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save"){
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.insert(expense, at: 0)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
