//
//  ContentView.swift
//  WeSplit
//
//  Created by Al Amin on 18/3/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var checkAmount = ""
//    @State private var numberOfPeople = 2
//    @State private var tipPercentage = 2
//    let tipPercentages =  [10, 15, 20, 25, 0]
//    var tipAmout: Double {
//        let cAmount = Double(checkAmount) ?? 0
//        let tipSelection = Double(tipPercentages[tipPercentage])
//        let noOfPeopleSelection = Double (numberOfPeople + 2)
//        return (cAmount+(cAmount * tipSelection / 100)) / noOfPeopleSelection
//
//    }
//
//    var TotalAmt: Double {
//        let cAmount = Double(checkAmount) ?? 0
//        let tipSelection = Double(tipPercentages[tipPercentage])
//        return cAmount + tipSelection
//
//    }
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "Fraswxnce", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingAlert = false
    var body: some View {
        
        NavigationView{
//            Form {
//                Section {
//                    TextField("Amount", text: $checkAmount)
//                        .keyboardType(.decimalPad)
//                    Picker("Number of people", selection: $numberOfPeople){
//                        ForEach(2..<100) { people in
//                            Text("\(people) People")
//                        }
//                    }
//                }
//
//                Section (header: Text("How much tip do you want to leafe?")){
//                    Picker("Tip percentage", selection: $tipPercentage) {
//                        ForEach(0 ..< tipPercentages.count){ tipper in
//                            Text("\(self.tipPercentages[tipper])%")
//                        }
//
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                }
//
//                Section(header: Text("Total Amout")){
//                    Text("$ \(TotalAmt,  specifier: "% .2f")")
//                }
//
//                Section(header: Text("Amount per person")) {
//                    Text("$ \(tipAmout , specifier: "% .2f")")
//                }
//            }
            
//            VStack (alignment: .leading){
//
//                Text("Hello World")
//                Text("This is inside a stack")
//
//            }
//        .padding()
//            .background(Color(red: 1, green: 0.8, blue: 0).edgesIgnoringSafeArea(.all))
//
//            ZStack {
//               Text("Hello World")
//                Text("This is inside a stack")
//            }
            
            
//            Button("Tap me!"){
//                print("Button was tapped")
//            }
            
//            Button(action: {
//                print("Button was tapped")
//            }){
//                HStack(spacing: 10){
//                   Image(systemName: "pencil")
//
//                    Text("Edit")
//                }
//            }
            
            
//            Button("Show Alert"){
//                self.showingAlert = true
//            }
//
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text("Hello SwiftUI"), message: Text("asdfsfsafsaf"), dismissButton: .default(Text("Ok")))
//            }
            
            
            
            
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of ")
                        .foregroundColor(.white)
                        Text(countries[correctAnswer])
                        .foregroundColor(.white)
                    }
                    
                    
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.flagTapped(number: number)
                            
                        }){
                            Image(self.countries[number])
                                .renderingMode(.original)
                            .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                        }
                    
                        .alert(isPresented: self.$showingAlert) {
                            Alert(title: Text(self.scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                                self.askQuastionAgain()
                            })
                        }
                        
                           
                    }
                    
                    Spacer()
                }
                
                
            }
                        
            .navigationBarTitle("SwiftUI")
            
        }
        
    }
    
    
    func flagTapped(number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingAlert = true
        
    }
    
    func askQuastionAgain() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
