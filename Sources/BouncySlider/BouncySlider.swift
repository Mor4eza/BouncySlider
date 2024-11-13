// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  BouncySlider.swift
//  BouncySlider
//
//  Created by Morteza on 11/12/24.
//
import SwiftUI

struct TestSlider: View {
    @State var value: CGFloat = 0.4
    var body: some View {
        BouncySlider(value: $value, orientation: .vertical) {
            if value == 0.0 {
                Image(systemName: "speaker.fill").foregroundStyle(.gray)
            } else if value <= 0.5 {
                Image(systemName: "speaker.wave.1.fill").foregroundStyle(.gray)
            
            } else {
                Image(systemName: "speaker.wave.2.fill").foregroundStyle(.gray)
            }
            
        }
           
    }
       
}


#Preview {
    TestSlider()
}

public struct BouncySlider<Content: View>: View {
    @Binding var value: CGFloat
    var maxValue: CGFloat = 1.0
    var minValue: CGFloat = 0.0
    var sliderLength: CGFloat = 200
    var orientation: Orientation = .vertical
    var backgroundColor: Color = .gray
    var fillColor: Color = .white
    var image: Content?
    
    @State private var lastDragValue: CGFloat = 0
    @State private var bounceEffect: CGFloat = 1.0
    
    public enum Orientation {
        case vertical, horizontal
    }
    
    public init(value: Binding<CGFloat>, maxValue: CGFloat = 1.0, minValue: CGFloat = 0.0, sliderLength: CGFloat = 200, orientation: Orientation = .vertical, backgroundColor: Color = .gray, fillColor: Color = .white, @ViewBuilder image: () -> Content) {
        self._value = value
        self.maxValue = maxValue
        self.minValue = minValue
        self.sliderLength = sliderLength
        self.orientation = orientation
        self.backgroundColor = backgroundColor
        self.fillColor = fillColor
        self.image = image()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: alignment) {
                // Background track
                Rectangle()
                    .foregroundColor(backgroundColor.opacity(0.3))
                    .cornerRadius(16)
                
                // Filled track based on value, with scale effect for bounce
                Rectangle()
                    .fill(style: FillStyle(eoFill: true, antialiased: true))
                    .cornerRadius(16)
                    .foregroundColor(fillColor)
                    .opacity(value < 0.01 ? 0.0 : 1.0)
                    .frame(
                        width: orientation == .horizontal ? sliderLength * normalizedValue : 60,
                        height: orientation == .vertical ? sliderLength * normalizedValue : 60
                    )
                
                image
                    .padding()
                    
                
            }
            
            .scaleEffect(bounceEffect, anchor: anchor)
            .animation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.4), value: bounceEffect)
            .gesture(
                DragGesture()
                
                    .onChanged { gesture in
                        let dragAmount = orientation == .vertical ? -gesture.translation.height : gesture.translation.width
                        let adjustedValue = lastDragValue + dragAmount / sliderLength
                        value = min(max(adjustedValue * (maxValue - minValue) + minValue, minValue), maxValue)
                        
                        if value == maxValue || value == minValue {
                            withAnimation(.linear) {
                                bounceEffect = 1.1 // Slightly enlarge on bounce
                            }
                        }
                    }
                    .onEnded { _ in
                        lastDragValue = (value - minValue) / (maxValue - minValue) // Normalized for next drag session
                        
                        // Revert back to original scale after a delay
                        withAnimation(.easeOut) {
                            bounceEffect = 1.0
                        }
                    }
            )
        }
        .frame(width: orientation == .vertical ? 60 : sliderLength,
               height: orientation == .horizontal ? 60 : sliderLength)
    }
    
    // Determines alignment and scale anchor based on orientation and value position
    private var alignment: Alignment {
        orientation == .vertical ? .bottom : .leading
    }
    
    private var anchor: UnitPoint {
        if orientation == .vertical {
            return .bottom
        } else {
            return .leading
        }
    }
    
    // Converts `value` to a normalized value between 0 and 1
    private var normalizedValue: CGFloat {
        (value - minValue) / (maxValue - minValue)
    }
}
