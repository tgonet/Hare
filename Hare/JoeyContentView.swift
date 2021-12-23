//
//  JoeyContentView.swift
//  Hare
//
//  Created by Aw Joey on 22/12/21.
//

import Foundation
import SwiftUI
import UIKit

struct JoeyContentView:View {
    var body: some View {
        ZStack{
            VStack{
                ContentView()
                VStack{
                    Text("Duration")
                        .font(Font.custom("Rubik-Regular", size:12))
                    Text("12:00:00")
                        .font(Font.custom("Sansita-BoldItalic", size:60))
                }
                HStack(spacing:50){
                    VStack{
                        Text("Distance")
                            .font(Font.custom("Rubik-Regular", size:12))
                        Text("2.55km")
                            .font(Font.custom("Sansita-BoldItalic", size:32))
                    }
                    VStack{
                        Text("Avg Pace")
                            .font(Font.custom("Rubik-Regular", size:12))
                        Text("6'55")
                            .font(Font.custom("Sansita-BoldItalic", size:32))
                    }
                }.padding(10)
                HStack(spacing: 55){
                    Button(action:{}, label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("AccentColor2"))
                            .padding(8)
                    })
                        .frame(width: 80, height: 80)
                        .background(Color("AccentColor"))
                        .clipShape(Circle())
                    
                    Button(action:{}, label: {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("AccentColor"))
                            .padding(8)
                    })
                        .frame(width: 80, height: 80)
                        .background(Color("AccentColor2"))
                        .clipShape(Circle())
                    
                }.padding(25)
            }
            .background(Color("BackgroundColor"))
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
        static var previews: some View {
            JoeyContentView()
        }
    }

