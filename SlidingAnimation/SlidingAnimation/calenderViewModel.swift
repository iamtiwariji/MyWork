//
//  calenderViewModel.swift
//  SlidingAnimation
//
//  Created by Rajaram Tiwari on 06/10/23.
//

import Foundation
import UIKit
import SwiftUI

class calenderViewModel: ObservableObject {
    @Published var currentSelectedDate = Date.currentDate
    @Published var date: String = ""
    @Published var isTransitioning = false
    var InsertDirection: Edge = .leading
    var removalDirection: Edge = .trailing

    func setupViewModel() {
        self.date = Date.getDateInDD_MMM_YYYYFormat(date: currentSelectedDate)
    }
    
    func getCurrentSelectedDate() -> String {
        return Date.getDateInDD_MMM_YYYYFormat(date: currentSelectedDate)
    }
    
    func backDateButtonAction() {
        isTransitioning = true
        print("Back tapped")
//        self.InsertDirection = .leading
//        self.removalDirection = .trailing
//        performTransition()
        self.currentSelectedDate = currentSelectedDate.getPreviousDate() ?? Date.currentDate
        self.date = Date.getDateInDD_MMM_YYYYFormat(date: currentSelectedDate)
        
        
    }
    
    func rightDateButtonAction() {
        isTransitioning = true
//        print("Forward Tapped")
//        self.InsertDirection = .trailing
//        self.removalDirection = .leading
//        performTransition()
        self.currentSelectedDate = currentSelectedDate.getNextDate() ?? Date.currentDate
        self.date = Date.getDateInDD_MMM_YYYYFormat(date: currentSelectedDate)
        
        
        
    }
    
    func performTransition() -> AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .push(from: InsertDirection),
            removal: .push(from: removalDirection)
        )
    }
    
//
//    func animateWith(_ duration: CFTimeInterval, animationDirection: CATransitionSubtype) {
//        let animation: CATransition = CATransition()
//        animation.timingFunction = CAMediaTimingFunction(name:
//            CAMediaTimingFunctionName.easeInEaseOut)
//        animation.type = CATransitionType.push
//        animation.subtype = animationDirection
//        animation.duration = duration
//        layer.add(animation, forKey: CATransitionType.push.rawValue)
//    }

}

