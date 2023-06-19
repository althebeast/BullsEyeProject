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
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false){
        if loadTestData{
            addToLeaderboard(score: 100)
        }
    }
    
    func points(sliderValue: Int) -> Int{
        
        let difference = abs(target - sliderValue)
        let bonus: Int
        
        if difference == 0{
            bonus = 100
        } else if difference <= 2{
            bonus = 50
        } else{
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int){
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restartGame(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int){
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { enrty1, enrty2 in
            enrty1.score > enrty2.score
        }
    }
}

struct LeaderboardEntry{
    let score: Int
    let date: Date
}
