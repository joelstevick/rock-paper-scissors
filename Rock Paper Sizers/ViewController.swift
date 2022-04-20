//
//  ViewController.swift
//  Rock Paper Sizers
//
//  Created by Joel Stevick on 4/20/22.
//

import UIKit

enum Tag: Int {
    case paper = 1, rock, scissors
}
enum Outcome {
    case win, lose, draw
}

struct Challenge: Hashable {
    var player: Tag
    var computer: Tag
}
let outcome: [Challenge: Outcome] = [
    Challenge(player: .paper, computer: .paper): .draw,
    Challenge(player: .paper, computer: .rock): .win,
    Challenge(player: .paper, computer: .scissors): .lose,
    Challenge(player: .rock, computer: .paper): .lose,
    Challenge(player: .rock, computer: .rock): .draw,
    Challenge(player: .rock, computer: .scissors): .win,
    Challenge(player: .scissors, computer: .paper): .win,
    Challenge(player: .scissors, computer: .rock): .lose,
    Challenge(player: .scissors, computer: .scissors): .draw
]
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print(sender.tag)
        
        let computer = Tag(rawValue: (Int(arc4random()) % 3) + 1)!
        
        let player =  Tag(rawValue: sender.tag)!
        
        let gameOutcome = outcome[Challenge(player: player, computer: computer)]!
        
        print(player, computer, gameOutcome)
    }

}

