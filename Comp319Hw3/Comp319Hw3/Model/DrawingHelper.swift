//
//  DrawingHelper.swift
//  Comp319Hw3
//
//  Created by BURAK on 1.01.2023.
//

import Foundation

class DrawingHelper {
    
    private var names: [String] = []
    weak var delegate: DrawingDelegate?
    
    init() {
        initializeAndShuffleNames()
    }
    
    private func initializeAndShuffleNames() {
        names.removeAll(keepingCapacity: true)
        names = ["Ahmet", "Mehmet", "Burak", "Tim", "John", "George",
        "Jonathan", "Jim", "Tom", "Mark"]
        
        names.shuffle()
    }
    
    func drawAName() -> String? {
        if names.count == 7 {
            initializeAndShuffleNames()
            delegate?.resetUI()
            return nil
        } else if names.count == 8 {
            delegate?.getReadyForShuffle()
        }
        return names.removeFirst()
    }
    
}
