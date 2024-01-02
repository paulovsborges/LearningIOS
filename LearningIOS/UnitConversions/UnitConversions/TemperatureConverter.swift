
import Foundation

enum UnitType : Int{
    case Celsius, Kelvin, Fahrenheit
}

protocol TemperatureConverter{
    
    var outputType : UnitType {get set}
    
    func convert(inputValue: Double) -> Double
}

class Celsius : TemperatureConverter{
    var outputType: UnitType
    
    init(outputType: UnitType) {
        self.outputType = outputType
    }
    
    func convert(inputValue: Double) -> Double {
        
        switch outputType{
            
        case .Celsius:
            return inputValue
        case .Kelvin:
            return inputValue + 273.15
        case .Fahrenheit:
            return inputValue * 1.8 + 32
        }
    }
}

class Kelvin : TemperatureConverter{
    var outputType: UnitType
    
    init(outputType: UnitType) {
        self.outputType = outputType
    }
    
    func convert(inputValue: Double) -> Double {
        
        switch outputType{
            
        case .Celsius:
            return inputValue - 273.15
        case .Kelvin:
            return inputValue
        case .Fahrenheit:
            return (inputValue - 273.15) * 1.8 + 32
        }
    }
}

class Fahrenheit : TemperatureConverter{
    var outputType: UnitType
    
    init(outputType: UnitType) {
        self.outputType = outputType
    }
    
    func convert(inputValue: Double) -> Double {
        
        switch outputType{
            
        case .Celsius:
            return (inputValue - 32) / 1.8
        case .Kelvin:
            return (inputValue - 32) * (5 / 9) + 273.15
        case .Fahrenheit:
            return inputValue
        }
    }
}


