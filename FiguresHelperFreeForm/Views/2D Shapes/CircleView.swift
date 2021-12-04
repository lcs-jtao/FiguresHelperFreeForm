//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Stored properties
    @State var providedRadius = ""
    
    // MARK: Computed properties
    
    // Check the input given by the user
    // If possible, returns a Double
    // Otherwise, returns nil
    var radius: Double? {
        
        // 1. Ensure that we can change the input (String) to a Double
        // 2. Ensure that the value is more than zero
        // To do this, we use a "guard" statement
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            // When either of the tests above do not pass, then we don't have a valid radius
            return nil
        }
        
        // If we get here, we know the radius is valid
        return radius
        
    }
    
    // Attempts to calculate the area - if it cannot, return nil
    var area: Double? {
        
        // Are the input(s) valid?
        // The "black" radius is a local constant
        // It only exists AFTER the guard statement
        guard let radius = radius
        else {
            // Input(s) not valid, so we cannot compute the area
            return nil
        }
        
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                TextField("Radius",
                          text: $providedRadius,
                          prompt: Text("Numeric value greater than 0"))
                // Ternary conditional operator
                // It's essentially a one-line if-else statement
                // CONDITION ? EXPRESSION-1 : EXPRESSION-2
                // CONDITION is: radius == nil
                // EXPRESSION-1 happens when TRUE: Color.red
                // EXPRESSION-2 happens when FALSE: Color.primary
                    .foregroundColor(radius == nil ? Color.red : Color.primary)
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Circle")
        .padding()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CircleView()
        }
    }
}
