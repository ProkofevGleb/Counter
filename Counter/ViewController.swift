//
//  ViewController.swift
//  Counter
//
//  Created by Глеб on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // связываем элементы интерфейса
    @IBOutlet weak private var valueCounterLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var subtractionButton: UIButton!
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    
    // задаем начальное значение для счётчика
    private var count = 0
    // создаем объект класса для форматирования даты
    private let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHistoryTextView()
    }
    
    // функция для вычисления и форматирования текущей даты
    private func currentTime() -> String {
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: Date())
        return formattedDate
    }
    
    // функция автоматического скролла по мере заполнения текстом
    private func scrollBottom() {
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    // настройки отображения для текстового поля с историей
    private func setupHistoryTextView() {
        historyTextView.layer.borderWidth = 2
        historyTextView.layer.cornerRadius = 10
        historyTextView.layer.borderColor = UIColor.systemBlue.cgColor
        historyTextView.isEditable = false
    }
    
    // устанавливаем действие при нажатии на кнопку минус
    @IBAction private func buttonSubtractionDidTap(_ sender: Any) {
        if count > 0 {
            count -= 1
            self.valueCounterLabel.text = "Значение счётчика: \(count)"
            self.historyTextView.text += "\n [\(currentTime())]: значение изменено на -1"
            
        } else {
            self.historyTextView.text += "\n [\(currentTime())]: попытка уменьшить значение счётчика ниже 0"
        }
        scrollBottom()
    }
    
    // устанавливаем действие при нажатии на кнопку плюс
    @IBAction private func buttonAddDidTap(_ sender: Any) {
        count += 1
        self.valueCounterLabel.text = "Значение счётчика: \(count)"
        self.historyTextView.text += "\n [\(currentTime())]: значение изменено на +1"
        scrollBottom()
    }
    
    // устанавливаем действие при нажатии на кнопку сброса
    @IBAction private func buttonResetDidTap(_ sender: Any) {
        count = 0
        self.valueCounterLabel.text = "Значение счётчика: \(count)"
        self.historyTextView.text += "\n [\(currentTime())]: значение сброшено"
        scrollBottom()
    }
}
