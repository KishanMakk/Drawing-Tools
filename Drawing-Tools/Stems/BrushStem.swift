// Swift toolchain version 5.0
// Running macOS version 10.15
// Created on 11/14/20.
//
// Author: Kieran Brown
//

import SwiftUI

struct BrushStem: View {
    var width: CGFloat = 100
    private let standardWidth: CGFloat = 100
    private var scaleFactor: CGFloat {
        width != 0 ? width/standardWidth : 1
    }
    private let standardHeight: CGFloat = 150
    private let strokeStyle: StrokeStyle
    private let color: Color
    
    init(width: CGFloat = 90) {
        self.width = width
        self.strokeStyle = StrokeStyle(lineWidth: 4, lineJoin: .round)
        self.color = Color(white: 0.1)
    }
    
    init(width: CGFloat = 90,
         color: Color = Color(white: 0.1),
         strokeStyle: StrokeStyle = StrokeStyle(lineWidth: 4, lineJoin: .round)) {
        self.width = width
        self.strokeStyle = strokeStyle
        self.color = color
    }
    
    var body: some View {
        BrushStemShape()
            .fill(color)
            .overlay(
                BrushStemShape()
                    .strokeBorder(color, style: strokeStyle)
            )
            .frame(width: width, height: scaleFactor*standardHeight)
    }
}

extension BrushStem: DrawingToolStem {
    var terminalWidth: CGFloat {
        width*0.4
    }
}

struct BrushStem_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            BrushStem()
            BrushStem(width: 200)
            BrushStem(width: 50)
        }
    }
}
