//
//  Logic.swift
//  BerlinClock
//
//  Created by Алдияр Айтпаев on 16.12.2021.
//

import Foundation

struct TimeInt {
    var hour: Int
    var minute: Int
    var second: Int
}

func hoursToLetters5(hours: Int) -> String {
    
    var letter = ""
    let numbers = [1, 2, 3, 4]
    
    var fourHoursCells = hours/5
    
    
    for _ in numbers {
        if fourHoursCells > 0 {
            letter += "R"
        }
        else {
            letter += "O"
        }
        fourHoursCells -= 1
    }
    return letter
}
    
func hoursToLetters1(hours: Int) -> String {
    
    var letter = ""
    let numbers = [1, 2, 3, 4]
    
    var singleHourCells = hours%5
    
    for _ in numbers {
        if singleHourCells > 0 {
            letter += "R"
        }
        else {
            letter += "O"
        }
        singleHourCells -= 1
    }
    
    return letter
}
func minutsToLetters5(minutes: Int ) -> String {
    var letter = ""
    let fiveMinuteCells = minutes/5
    
    for i in 0..<11 {
        if fiveMinuteCells > i {
            if i % 3 == 2 {
                letter += "R"
            }
            else {
                letter += "Y"
            }
        } else {
            if i % 3 == 2 {
                letter += "T"
            }
            else {
                letter += "G"
            }
            
        }
        
    }
    

    
    return letter
}

func minutsToLetters1(minutes: Int ) -> String {
    var letter = ""
    let nums = [1,2,3,4]
    
    var singleMinuteCells = minutes%5
    
    for _ in nums {
        if singleMinuteCells > 0 {
            letter += "Y"
        }
        else {
            letter += "O"
        }
        singleMinuteCells -= 1
    }
    
    
    return letter
}


func getTimeInInts(date: Date) -> TimeInt {
    let calendar = Calendar.current
    
    let seconds = calendar.component(.second, from: date)
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    return TimeInt(hour: hour, minute: minute,second: seconds)
}


