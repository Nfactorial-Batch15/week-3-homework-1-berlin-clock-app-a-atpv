//
//  ContentView.swift
//  BerlinClock
//
//  Created by Алдияр Айтпаев on 16.12.2021.
//

import SwiftUI


struct ContentView: View {
    @State var timeInInt = TimeInt(hour: 0, minute: 0, second: 0)
    @State private var time: Date = Date()
//    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() //to show in real time
    

    var body: some View {
        
        VStack{
            Text("Time is \(timeInInt.hour) : \(timeInInt.minute)")
                .frame(width: 130, height: 22)
                .font(.system(size: 17, weight: .semibold, design: .default))
            
            ZStack{
                Rectangle()
                    .frame(width: 358, height: 312)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.05), radius: 14, x: 0, y: 6)
                
                VStack{
                    
                    if timeInInt.second%2 == 0 {
                        MyCirclle(color: MyColors.yellow)
                    } else {
                        MyCirclle(color: MyColors.yellow1)
                    }
                    
                    HStack {
                        let a =  hoursToLetters5(hours: timeInInt.hour)
                        
                        ForEach(Array(a), id: \.self) { hour in
                            if hour == "R" {
                                WideRectangle(color: MyColors.red)
                            }
                            else {
                                WideRectangle(color:MyColors.red1)
                            }
                        }
                        
                        
                    }
                    
                    HStack {
                        let a =  hoursToLetters1(hours: timeInInt.hour)
                        
                        ForEach(Array(a), id: \.self) { hour in
                            if hour == "R" {
                                WideRectangle(color: MyColors.red)
                            }
                            else {
                                WideRectangle(color:MyColors.red1)
                            }
                        }
                        
                    }
                    
                    HStack {
                        let a =  minutsToLetters5(minutes: timeInInt.minute)
                        
                        ForEach(Array(a), id: \.self) { minute in
                            if minute == "Y" {
                                ThinRectangle(color: MyColors.yellow)
                            }
                            else if minute == "R" {
                                ThinRectangle(color: MyColors.red)
                            }
                            
                            else if minute == "T" {
                                ThinRectangle(color: MyColors.red1)
                            }
                            else {
                                ThinRectangle(color:MyColors.yellow1)
                            }
                        }
                        
                    }
                    
                    HStack {
                        let a =  minutsToLetters1(minutes: timeInInt.minute)
                        
                        ForEach(Array(a), id: \.self) { hour in
                            if hour == "Y" {
                                WideRectangle(color: MyColors.yellow)
                            }
                            else {
                                WideRectangle(color:MyColors.yellow1)
                            }
                        }
                        
                    }
                }
            }
            
            ZStack{
                Rectangle()
                    .frame(width: 358, height: 54)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.05), radius: 14, x: 0, y: 5)
                
                //                Text("Insert Time")
                DatePicker("Insert Time", selection: $time, displayedComponents: .hourAndMinute)
                    .environment(\.locale, Locale(identifier: "ru-RU"))
                    .frame(width: 326, height: 54)
                    .datePickerStyle(.compact)
//                    .onReceive(timer) { input in
//                        time = input
//                    } // 14s line
                    .onChange(of: time) { _ in
                        self.updateState()
                    }
            }
        }
    }
    
    
    func updateState() {
        self.timeInInt = getTimeInInts(date: self.time)
       
    }
}
        
        
struct MyCirclle: View {
    var color: Color
    var body: some View {
        Circle()
            .frame(width: 56, height: 56,alignment: .top)
            .foregroundColor(color)
            .padding()
        
    }
}

struct WideRectangle: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 74, height: 32)
            .foregroundColor(color)
        
    }
}

struct ThinRectangle: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: 21, height: 32)
            .foregroundColor(color)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
