//
//  ViewController.swift
//  Counter
//
//  Created by Глеб on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueCounterLabel: UILabel!
    @IBOutlet weak var changeCounterButton: UIButton!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        self.valueCounterLabel.text = "Значение счетчика: \(count)"
    }
    
}
