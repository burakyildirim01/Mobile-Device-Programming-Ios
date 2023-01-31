//
//  DrawingViewModel.swift
//  Comp319Hw3
//
//  Created by BURAK on 1.01.2023.
//

import SwiftUI

class DrawingViewModel: ObservableObject {
    
    private let drawingHelper = DrawingHelper()
    @Published var name1 = " "
    @Published var name2 = " "
    @Published var name3 = " "
    @Published var drawButtonTitle = "DRAW"
    
    init() {
        drawingHelper.delegate = self
    }
    
    func drawNames(){
        let name = drawingHelper.drawAName()
        if let name {
            if name1 == " "{
                name1 = name
            }
            else if name2 == " " {
                name2 = name
            }
            else if name3 == " " {
                name3 = name
            }
        }
    }
    
}

extension DrawingViewModel: DrawingDelegate {
    func getReadyForShuffle() {
        drawButtonTitle = "CLEAR"
    }
    
    func resetUI() {
        drawButtonTitle = "DRAW"
        name1 = " "
        name2 = " "
        name3 = " "
    }
    
    
}
