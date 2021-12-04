//
//  ParallelogramView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct ParallelogramView: View {
    
    // MARK: Stored properties
    @State var providedBase = ""
    @State var providedHeight = ""
    @State var providedDiagonal = ""

    // MARK: Computed properties
    var base: Double? {
        guard let base = Double(providedBase),
              base > 0
        else {
            return nil
        }
        return base
    }
    
    var height: Double? {
        guard let height = Double(providedHeight),
              height > 0
        else {
            return nil
        }
        return height
    }
    
    var diagonal: Double? {
        guard let diagonal = Double(providedDiagonal),
              diagonal > 0
        else {
            return nil
        }
        return diagonal
    }
    
    var area: Double? {
        guard let base = base, let height = height
        else {
            return nil
        }
        return base * height
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "parallelogram",
                            horizontalPadding: 50)
                
                
                // Base
                Group {
                    
                    SectionLabelView(text: "Base", variable: "b")

                    // Input: Base
                    TextField("Base",
                              text: $providedBase,
                              prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(base == nil ? Color.red : Color.primary)

                }
                
                // Height
                Group {
                    
                    SectionLabelView(text: "Height", variable: "h")

                    // Input: Height
                    TextField("Height",
                              text: $providedHeight,
                              prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(height == nil ? Color.red : Color.primary)

                }

                // Diagonal
                Group {
                    
                    SectionLabelView(text: "Diagonal", variable: "c")

                    // Input: Height
                    TextField("Diagonal",
                              text: $providedDiagonal,
                              prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(diagonal == nil ? Color.red : Color.primary)

                }

                SectionLabelView(text: "Area", variable: "a")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Parallelogram")
        .padding()
    }
}

struct ParallelogramView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParallelogramView()
        }
    }
}
