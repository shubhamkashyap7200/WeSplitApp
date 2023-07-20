//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Shubham on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students: [String] = ["Harry", "Hermonie", "Ron" , "Draco", "Goyle"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        //        Button("Tap Count :: \(tapCount)") {
        //            tapCount += 1
        //        }
        
        //        Form {
        //            TextField("Enter name", text: $name)
        //            Text("Your name is \(name)")
        //        }
        
        //        Form {
        //            ForEach(0..<100) { number in
        //                Text("Row \(number)")
        //            }
        //        }
        
        NavigationStack {
            Form {
                Picker("Select Student name", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            .navigationTitle("Student Database")
        }
        
    }
    
}

#Preview {
    ContentView()
}
