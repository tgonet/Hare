//
//  StopwatchManager.swift
//  Hare
//
//  Created by Tan Ming Zhe on 27/12/21.
//

import Foundation
import SwiftUI

class StopwatchManager : ObservableObject{
    @Published var secondsElapsed = 0.0
    @Published var mode: stopWatchMode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
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
