//
//  ContentView.swift
//  LengthConversion
//
//  Created by john martin on 9/8/22.
//

import SwiftUI

struct UnitSelection: Hashable {
    let id: String
    let unit: Dimension
}

let UNITS: [UnitSelection] = [
    UnitSelection(id: "meters", unit: UnitLength.meters),
    UnitSelection(id: "kilometers", unit: UnitLength.kilometers),
    UnitSelection(id: "feet", unit: UnitLength.feet),
    UnitSelection(id: "yards", unit: UnitLength.yards),
    UnitSelection(id: "miles", unit: UnitLength.miles)
]


struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var inputUnitSelection = UNITS[0]
    @State private var outputUnitSelection = UNITS[1]
    
    @FocusState private var inputIsFocused: Bool
            
    private func getResults() -> Double  {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnitSelection.unit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnitSelection.unit)
        return outputMeasurement.value
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section {
                    
                    TextField("Input Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Input Value")
                }
                    
                Section {
                   
                    Picker("Input Units:", selection: $inputUnitSelection) {
                        ForEach(UNITS, id: \.self) {
                            Text($0.id)
                        }
                    }
                    
                    Picker("Output Units:", selection: $outputUnitSelection) {
                        ForEach(UNITS, id: \.self) {
                            Text($0.id)
                        }
                    }
                    
                } header: {
                    Text("Units")
                }
                
                Section {
                    Text("\(getResults().formatted()) \(outputUnitSelection.id)")
                } header: {
                    Text("Results")
                }
                
            }
            .navigationTitle("Unit Conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
