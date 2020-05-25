//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Brown Jawn on 5/25/20.
//  Copyright © 2020 Brown Jawn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var converted = ""
    @State private var unit1 = 3;
    @State private var unit2 = 3;
    
    var conversion : Double {
        let multiplier = conversions[unit1][unit2]
        let initialAmount = Double(converted) ?? 0
        return initialAmount*multiplier
    }
    
    let unitTypes = ["Meters", "Kilometers", "Feet","Yards","Miles"]
    let conversions = [[1.0000, 0.001,3.28084,1.09361,0.000621371],
                        [1000.00,1.00,3280.84,1093.61,0.621371],
                        [0.3048,0.0003048,1.000,0.333333,0.000189394],
                        [0.9144,0.0009144,3.000,1.000,0.000568182],
                        [1609.34,1.60934,5280,1760,1.000]]

    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Please choose a unit to convert from")){
                    Picker(selection: $unit1, label: Text("Please choose a unit to convert from")) {
                       ForEach(0 ..< self.unitTypes.count) {
                          Text(self.unitTypes[$0])
                       }
                    }//.pickerStyle(SegmentedPickerStyle())
                    TextField("Enter value to convert", text: $converted)
                }
                Section(header:Text("Please choose a unit to convert to")){
                    Picker(selection: $unit2, label: Text("Please choose a unit to convert to")) {
                       ForEach(0 ..< self.unitTypes.count) {
                          Text(self.unitTypes[$0])
                       }
                    }
                    Text("The resulting value is \(conversion,specifier: "%2.f") \(unitTypes[unit2])")
                }
            }
            .navigationBarTitle("Unit Conversion")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
