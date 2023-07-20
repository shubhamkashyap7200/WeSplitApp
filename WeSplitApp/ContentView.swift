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
    
    let currencyCalculator = Locale.current.currency?.identifier ?? "USD"
    
    var grandTotalAmount:Double {
        let tipSelection: Double = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotalAmount = checkAmount + tipValue

        return grandTotalAmount
    }
    
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
                
                // MARK: Amount Selection

                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyCalculator))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) People")
                        }
                    }
                }
                
                // MARK: Tip Percentage Selection

                Section {
                    Picker("Select Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                        
//                        ForEach(0..<101, id: \.self) {
//                            Text($0, format: .percent)
//                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip you want to leave?")
                }
                
                // MARK: Grand Total Amount = checkAmount + tipAmount
                Section {
                    Text(grandTotalAmount, format: .currency(code: currencyCalculator))
                } header: {
                    Text("Grand total amount")
                }

                
                // MARK: Amount per person

                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
            }
            
            .navigationTitle("Bill Splitter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
