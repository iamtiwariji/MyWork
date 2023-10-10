//
//  SlidingAnimationApp.swift
//  SlidingAnimation
//
//  Created by Rajaram Tiwari on 06/10/23.
//

import SwiftUI

@main
struct SlidingAnimationApp: App {
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            KeyboardTimeView(viewModel: calenderViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
