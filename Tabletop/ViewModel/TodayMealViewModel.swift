//
//  TodayMealViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import Combine

class TodayMealViewModel: ObservableObject {
        
    // Function to calculate time remaining until midnight
    func timeUntilMidnight() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        // Get midnight of the next day
        var components = calendar.dateComponents([.year, .month, .day], from: now)
        components.day! += 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        let midnightOfNextDay = calendar.date(from: components)!
        
        // Calculate time difference between now and midnight of next day
        let timeDifference = calendar.dateComponents([.hour, .minute], from: now, to: midnightOfNextDay)
        
        // Format the time difference
        let hours = timeDifference.hour ?? 0
        let minutes = timeDifference.minute ?? 0
        
        return "\(hours) hr, \(minutes) min left to post"
    }
    
    // Function to calculate time remaining until meal start
    func timeUntilMealStart(mealType: MealType) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let mealStartTime: Int

        switch mealType {
            case .breakfast:
                mealStartTime = 6
            case .lunch:
                mealStartTime = 11
            case .dinner:
                mealStartTime = 17
        }
        
        
        // Get today's date with meal start time
        var mealDateComponents = calendar.dateComponents([.year, .month, .day], from: now)
        mealDateComponents.hour = mealStartTime
        mealDateComponents.minute = 0
        mealDateComponents.second = 0
        let mealStartDate = calendar.date(from: mealDateComponents)!
        
        // Calculate time difference between now and meal start date
        let timeDifference = calendar.dateComponents([.hour, .minute], from: now, to: mealStartDate)
        
        // Format the time difference
        let hours = timeDifference.hour ?? 0
        let minutes = timeDifference.minute ?? 0
        
        return "Come back in \(hours) hr, \(minutes) min"
    }
}
