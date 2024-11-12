//
//  ContentView.swift
//  BouncySlider_example
//
//  Created by Morteza on 11/12/24.
//

import SwiftUI
import BouncySlider

struct ContentView: View {

    @State var value: CGFloat = 0.5
    var body: some View {
        VStack {
            BouncySlider(value: $value, orientation: .vertical) {
                if value == 1.0 {
                    Image(systemName: "speaker.wave.3.fill").foregroundStyle(.gray)
                } else if value < 1.0 && value > 0.36 {
                    Image(systemName: "speaker.wave.2.fill").foregroundStyle(.gray)
                } else if value <= 0.35 && value > 0.0 {
                    Image(systemName: "speaker.wave.1.fill").foregroundStyle(.gray)
                } else {
                    Image(systemName: "speaker.fill").foregroundStyle(.gray)
                }
                
            }
            Text("Volume: \(Int(value * 100))%")
                
        }

    }
}

#Preview {
    ContentView()
}
