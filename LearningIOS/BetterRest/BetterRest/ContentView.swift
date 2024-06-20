//
//  ContentView.swift
//  BetterRest
//
//  Created by Borges on 20/06/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    @State private var dialogTitle = ""
    @State private var dialogMessage = ""
    @State private var isShowingDialog = false
    
    static var defaultWakeTime : Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        //        VStack{
        //
        //            Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
        //
        //            DatePicker("Pick a date",
        //                       selection: $wakeUp,
        //                       in: Date.now... // it will let the user pick only dates from today until infinite future
        //            )
        //            .labelsHidden()
        //
        //            Text(Date.now.formatted(date: .long, time: .shortened))
        //
        //
        //        }
        
        NavigationStack{
            Form{
                VStack(alignment: .leading, spacing: 10){
                    Text("When do you wan to wake up?").font(.headline)
                    
                    DatePicker("Enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Desired amount of sleep").font(.headline)
                    
                    Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                }
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Coffe intake amount").font(.headline)
                    
                    Stepper(coffeAmount > 1 ? "\(coffeAmount) cups" : "\(coffeAmount) cup", value: $coffeAmount, in: 1...20)
                    
                }
            }
            .navigationTitle("Better rest")
            .toolbar{
                Button("Calculate", action: calculateBedTime)
            }
            .alert(dialogTitle, isPresented: $isShowingDialog){
                Button("OK"){}
            } message: {
                Text(dialogMessage)
            }
        }
    }
    
    private func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from:wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            dialogTitle = "Proper bed time is..."
            dialogMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }catch{
            dialogTitle = "Error"
            dialogMessage = "There was an unexpected error"
        }
        
        isShowingDialog = true
    }
//
//    private func dateExamples() -> Date{
//        return Date.now.addingTimeInterval(86400)
//    }
    
//    private func dateExamples(){
//
////        var components = DateComponents()
////        components.hour = 8
////        components.minute = 0
////        let date = Calendar.current.date(from: components) ?? .now
//
//
//        let components  = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//    }
}

#Preview {
    ContentView()
}
