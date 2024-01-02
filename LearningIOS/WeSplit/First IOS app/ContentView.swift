
import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isAmountFocused : Bool
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    private var totalPerPerson : Double{
        
        let peopleCount = Double(numberOPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    private var totalValue: Double{
        let tipValue = checkAmount / 100 * (Double(tipPercentage))
        
        return checkAmount + tipValue
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    
                    // $ symbol indicates a two way binding property, it can read from it and can write to it
                    
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isAmountFocused)
                    
                    Picker("Number of people", selection: $numberOPeople){
                        ForEach(2..<100){ number in
                            Text("\(number)")
                        }
                    }
                }
                
                Section("Select the tip amount"){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101, id: \.self){ tip in
                            Text(tip, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Amout per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total amount"){
                    Text(totalValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    if isAmountFocused {
                        Button("Done"){
                            isAmountFocused = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
