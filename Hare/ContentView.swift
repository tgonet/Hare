//
//  ContentView.swift
//  Hare
//
//  Created by Tan Ming Zhe on 20/12/21.
//

import SwiftUI
import MapKit

var latitude = 37.330828
var longtitude = -122.007495

struct ContentView: View {
    
   
    @State private var region = MKCoordinateRegion(
    // Apple Park
    center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    

    @State var lineCoordinates = [

    // Steve Jobs theatre
        CLLocationCoordinate2D(latitude: latitude, longitude: longtitude),
        // Caffè Macs
        CLLocationCoordinate2D(latitude: latitude+0.000002, longitude: longtitude-0.006),
        // Apple wellness center
        CLLocationCoordinate2D(latitude: 37.336901, longitude:  -122.012345)
    ]

  var body: some View {
      HStack {
          MapView(
          region: region,
          lineCoordinates: lineCoordinates
        ).edgesIgnoringSafeArea(.all).onReceive(timer) { time in
            print(latitude)
            latitude += 0.001
            longtitude -= 0.001
            lineCoordinates.append(CLLocationCoordinate2D(latitude: latitude, longitude: longtitude))
            print("test")
          }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
