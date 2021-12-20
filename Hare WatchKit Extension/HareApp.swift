//
//  HareApp.swift
//  Hare WatchKit Extension
//
//  Created by Tan Ming Zhe on 20/12/21.
//

import SwiftUI

@main
struct HareApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
