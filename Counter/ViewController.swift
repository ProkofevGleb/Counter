//
//  ViewController.swift
//  Counter
//
//  Created by Глеб on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueCounterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var count = 0
    
    let dateFormatter = DateFormatter()
    
    func currentTime() -> String {
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: Date())
        return formattedDate
    }
    
    func scrollBottom() {
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.historyTextView.layer.borderWidth = 2
        self.historyTextView.layer.cornerRadius = 10
        self.historyTextView.layer.borderColor = UIColor.systemBlue.cgColor
        self.historyTextView.isEditable = false
    }
    
    @IBAction func buttonSubtractionDidTap(_ sender: Any) {
        if count > 0 {
            count -= 1
            self.valueCounterLabel.text = "Значение счётчика: \(count)"
            self.historyTextView.text += "\n [\(currentTime())]: значение изменено на -1"
            
        } else {
            self.historyTextView.text += "\n [\(currentTime())]: попытка уменьшить значение счётчика ниже 0"
        }
        scrollBottom()
    }
    
    @IBAction func buttonAddDidTap(_ sender: Any) {
        count += 1
        self.valueCounterLabel.text = "Значение счётчика: \(count)"
        self.historyTextView.text += "\n [\(currentTime())]: значение изменено на +1"
        scrollBottom()
    }
    
    @IBAction func buttonResetDidTap(_ sender: Any) {
        count = 0
        self.valueCounterLabel.text = "Значение счётчика: \(count)"
        self.historyTextView.text += "\n [\(currentTime())]: значение сброшено"
        scrollBottom()
    }
    
}
