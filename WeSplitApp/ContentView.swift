//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Shubham on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson : Double {
        // calculate the total amount
        let peopleCount: Double = Double(numberOfPeople)
        let tipSelection: Double = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section {
                    Picker("Select Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            
            .navigationTitle("Bill Splitter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        amountIsFocused = true
                    }
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
