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
    
    var player = Tag(rawValue: Tag.scissors.rawValue)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rockPressed(_ sender: UIButton) {
        // Get the OutcomeViewController
        let controller: OutcomeViewController
        player =  Tag(rawValue: Tag.rock.rawValue)!
        controller = storyboard?.instantiateViewController(withIdentifier: "outcomeVC") as! OutcomeViewController
        
        // play the game
        playGame(controller)
        
        // Present the view Controller
        present(controller, animated: true, completion: nil)
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        player =  Tag(rawValue: sender.tag)!
        
        performSegue(withIdentifier: "outcome", sender: self)
    }
    func playGame(_ outcomeViewController: OutcomeViewController) {
        // play the game
        let computer = Tag(rawValue: (Int(arc4random()) % 3) + 1)!
        
        let outcome = outcome[Challenge(player: player, computer: computer)]!
    
        
        // determine the image
        if outcome == Outcome.draw {
            outcomeViewController.imageName = "itsATie.png"
        } else {
            switch(player) {
            case .rock:
                if outcome == Outcome.win {
                    outcomeViewController.imageName = "RockCrushesScissors.jpeg"
                } else {
                    outcomeViewController.imageName = "PaperCoversRock.jpg"
                }
            case .scissors:
                if outcome == Outcome.win {
                    outcomeViewController.imageName = "ScissorsCutPaper.jpg"
                } else {
                    outcomeViewController.imageName = "RockCrushesScissors.jpeg"
                }
            case .paper:
                if outcome == Outcome.win {
                    outcomeViewController.imageName = "PaperCoversRock.jpg"
                } else {
                    outcomeViewController.imageName = "ScissorsCutPaper.jpg"
                }
            }
        }
        
        outcomeViewController.outcome = outcome
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check for configured segue
        if (segue.identifier == "fromScissors") {
            player = Tag(rawValue: Tag.scissors.rawValue)!
        }
        let outcomeViewController = segue.destination as! OutcomeViewController
        // play the game
        playGame(outcomeViewController)
       
    }
    
}

