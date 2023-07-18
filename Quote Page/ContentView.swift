//
//  ContentView.swift
//  Quote Page
//
//  Created by Libbey Kwok on 7/18/23.
//

import Foundation
import UIKit
import SwiftUI

struct ContentView: View {
    var quotes = ["It always seems impossible until it's done", "It does not matter how slowly you go as long as you do not stop.", "Do one thing that scares you everyday."]
    var authors = ["Nelson Mandela", "Confucius", "Eleanor Roosevelt"]
    @State var randomNum = 0
    var body: some View {
        NavigationStack{
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(hex: "CDD7B6"))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                    VStack{
                        Text("RevvIT")
                            .font(.largeTitle)
                            .padding()
                        Spacer()
                            .frame(height: 40)
                        randomNum = Int.random(in: 1..<authors.count)
                        
                            Text("\"It's never too late to be what you could've been.\"")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("- Somebody")
                            .font(.title)
                        
                            .foregroundColor(Color(hex: "EAECE3"))
                        Spacer()
                            .frame(height:60)
                        //CHANGE THE DESTINATION
                        NavigationLink(destination: homepage()) {
                            Text("Start")
                            

                        }
                    }
                    
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
