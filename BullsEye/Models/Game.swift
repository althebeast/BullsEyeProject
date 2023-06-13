//
//  Game.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 24.05.2023.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int{
        return 100 - abs(target - sliderValue)
    }
}
