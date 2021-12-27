//
//  StopwatchManager.swift
//  Hare
//
//  Created by Tan Ming Zhe on 27/12/21.
//

import Foundation
import SwiftUI
import MapKit

class StopwatchManager : ObservableObject{
    @Published var secondsElapsed = 0
    var sec = "0"
    var min = "0"
    var hr = "0"
    @Published var timeStr = "00:00:00"
    @Published var mode: stopWatchMode = .stopped
    var timer = Timer()
    var latitude = 37.330828
    var longtitude = -122.007495
    
    @Published var lineCoordinates = [

    // Steve Jobs theatre
        CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495),
        // Caffè Macs
        CLLocationCoordinate2D(latitude: 37.330828+0.000002, longitude: -122.007495-0.006),
        // Apple wellness center
        CLLocationCoordinate2D(latitude: 37.336901, longitude:  -122.012345)
    ]
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
            self.sec = self.secondsElapsed % 60 > 0 ? String(format: "%02d", self.secondsElapsed % 60) : "00"
            self.min = ((self.secondsElapsed % 3600) / 60) > 0 ? String(format: "%02d", (self.secondsElapsed % 3600) / 60) : "00"
            self.hr = (self.secondsElapsed / 3600) > 0 ? String(format: "%02d", self.secondsElapsed / 3600) : "00"
            self.timeStr = "\(self.hr):\(self.min):\(self.sec)"
            self.latitude += 0.001
            self.longtitude -= 0.001
            self.lineCoordinates.append(CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longtitude))
            
        }
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
}

enum stopWatchMode {
    case running
    case stopped
    case paused
}
