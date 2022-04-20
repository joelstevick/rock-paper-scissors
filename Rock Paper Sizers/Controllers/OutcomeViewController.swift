//
//  OutcomeViewController.swift
//  Rock Paper Sizers
//
//  Created by Joel Stevick on 4/20/22.
//

import Foundation
import UIKit

class OutcomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    var outcome: Outcome!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        
    }
}
