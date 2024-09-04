//
//  NutritionTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-22.
//

import SwiftUI

struct CircleGraph: View {
    // MARK: VARIABLES
    @State private var drawingStroke = false
    let red = Color(#colorLiteral(red: 0.9843137255, green: 0.0862745098, blue: 0.3490196078, alpha: 1))
    let green = Color(#colorLiteral(red: 0.3254901961, green: 0.9058823529, blue: 0.568627451, alpha: 1))
    let yellow = Color(#colorLiteral(red: 1, green: 0.9250007868, blue: 0, alpha: 1))
    
    let progress: CGFloat
    let title: String
    let color: Color
    let colorBackground: Color
    
    let animation = Animation
        .interactiveSpring(duration: 1, extraBounce: 0.15)
        .delay(0.5)
    
    // MARK: INIT
    init(progress: CGFloat, title: String, color: Color?) {
        self.progress = progress
        self.title = title
        
        if color == nil {
            if progress < 0.5 {
                self.color = red
                self.colorBackground = red.opacity(0.3)
            } else if progress < 0.8 {
                self.color = yellow
                self.colorBackground = yellow.opacity(0.3)
            } else if progress < 1.05 {
                self.color = green
                self.colorBackground = green.opacity(0.3)
            } else if progress < 1.15 {
                self.color = yellow
                self.colorBackground = yellow.opacity(0.3)
            } else {
                self.color = red
                self.colorBackground = red.opacity(0.3)
            }
        } else {
            self.color = color!
            self.colorBackground = color!.opacity(0.3)
        }
        
    }
    
    // MARK: FUNCTIONS
    func ring(for color: Color) -> some View {
        // Background ring
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 16))
            .foregroundStyle(colorBackground)
            .shadow(color: colorBackground, radius: 3)
            .overlay {
                // Foreground ring
                Circle()
                    .trim(from: 0, to: drawingStroke ? progress : 0)
                    .stroke(color.gradient,
                            style: StrokeStyle(lineWidth: 16, lineCap: .round))
                //                    .shadow(color: .tile, radius: 3)
            }
            .rotationEffect(.degrees(-90))
    }
    
    // MARK: BODY
    var body: some View {
        ring(for: color)
            .animation(animation, value: drawingStroke)
            .onAppear {
                drawingStroke.toggle()
            }
    }
}

#Preview {
    CircleGraph(progress: 1.9, title: "Calories", color: nil)
}
