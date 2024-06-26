
import SwiftUI

@Observable
class Expenses{
    var items = [ExpenseItem](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: Constants.userDefaultKey)
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: Constants.userDefaultKey){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
}

enum ExpensesFilterType: CaseIterable{
    case all; case personal; case business
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var isSHowingAddExpense = false
    
    @State private var currentTypeFilter : ExpensesFilterType = .all
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading, content: {
                
                Picker("Filter for $\(currentTypeFilter)", selection: $currentTypeFilter){
                    ForEach(ExpensesFilterType.allCases, id: \.self){ type in
                        Text("\(type)")
                    }
                }.pickerStyle(.segmented)
                
                List{
                    
                    if isCurrentFilterSelectedNotEmpty() {
                        
                        ForEach(expenses.items){ item in
                            
                            switch currentTypeFilter {
                            case .all:
                                ExpenseItemView(name: item.name, type: item.type, amount: item.amount)
                            case .personal:
                                if item.type == .Personal{
                                    ExpenseItemView(name: item.name, type: item.type, amount: item.amount)
                                }
                            case .business:
                                if item.type == .Business {
                                    ExpenseItemView(name: item.name, type: item.type, amount: item.amount)
                                    
                                }
                            }
                            
                        }.onDelete(perform: deleteExpense)
                    }else{
                        
                        VStack(alignment: .center, content: {
                            Text("Nothing here")
                        })
                    }
                    
                }
            })
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add expense", systemImage: "plus"){
                    isSHowingAddExpense.toggle()
                }
                
            }.sheet(isPresented: $isSHowingAddExpense, content: {
                AddExpenseView(expenses: expenses)
            })
        }
    }
    
    private func deleteExpense(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
    
    private func isCurrentFilterSelectedNotEmpty() -> Bool{
        
        let currentFilter : ExpenseType? = switch currentTypeFilter {
        case .all:
            nil
        case .personal:
            ExpenseType.Personal
        case .business:
            ExpenseType.Business
        }
        
        if currentFilter == nil {
            return expenses.items.count > 0
        }
        
        let filteredItems = expenses.items.filter{
            $0.type == currentFilter
        }
        
        return filteredItems.count > 0
    }
}

#Preview {
    ContentView()
}
