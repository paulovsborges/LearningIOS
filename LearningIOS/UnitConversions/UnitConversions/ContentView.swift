
import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0
    @State private var inputUnit : Int = 0
    @State private var outputUnit : Int = 1
    
    private var result : Double{
        
        let inputType = getUnitTypeFromInt(input: inputUnit)
        let outputType = getUnitTypeFromInt(input: outputUnit)
        
        switch inputType{
            
        case .Celsius:
            let converter = Celsius(outputType: outputType)
            return converter.convert(inputValue: Double(inputValue))
        case .Kelvin:
            let converter = Kelvin(outputType: outputType)
            return converter.convert(inputValue: Double(inputValue))
        case .Fahrenheit:
            let converter = Fahrenheit(outputType: outputType)
            return converter.convert(inputValue: Double(inputValue))
        }
    }
    
    var body: some View {
        
        VStack {
            
            Form{
                
                Section{
                    Picker("Select the input unit", selection: $inputUnit){
                        ForEach(0..<3, id: \.self){ index in
                            Text("\(getUnitTypeDisplayName(index: index))")
                        }
                    }
                    Picker("Select the output unit", selection: $outputUnit){
                        ForEach(0..<3, id: \.self){ index in
                            Text("\(getUnitTypeDisplayName(index: index))")
                        }
                    }
                }
                
                Section("Enter the input value"){
                    TextField("\(getUnitTypeDisplayName(index:inputUnit))", value: $inputValue, format: .number)
                }
                
                Section{
                    Text("Converting \(inputValue)" + " \(getUnitTypeFromInt(input:inputUnit)) to \(getUnitTypeFromInt(input:outputUnit)) is")
                    
                    Text(result, format: .number)
                }
            }
        }
    }
}

private func getUnitTypeFromInt(input : Int) -> UnitType{
    switch input{
    case UnitType.Celsius.rawValue:
        return UnitType.Celsius
    case UnitType.Fahrenheit.rawValue:
        return UnitType.Fahrenheit
    case UnitType.Kelvin.rawValue:
        return UnitType.Kelvin
    default:
        return UnitType.Celsius
    }
}

private func getUnitTypeDisplayName(index : Int) -> String{
    switch index{
    case UnitType.Celsius.rawValue:
        return "Celsius"
    case UnitType.Fahrenheit.rawValue:
        return "Fahrenheit"
    case UnitType.Kelvin.rawValue:
        return "Kelvin"
    default:
        return "Celsius"
    }
}

#Preview {
    ContentView()
}
