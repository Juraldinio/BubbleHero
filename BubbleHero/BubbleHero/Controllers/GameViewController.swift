//
//  GameViewController.swift
//  BubbleHero
//
//  Created by Yunpeng Niu on 27/02/18.
//  Copyright © 2018 Yunpeng Niu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Always hide the status bar on the top.
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func loadLevel(_ level: Level) {
        
    }
}
