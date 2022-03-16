//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultIconLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
     var responses: [Answer]!
//     1. Передать массив с ответами на экран с результатами
//     2. Определить наиболее часто встречающийся тип животного
//     3. Отобразить результаты в соответствии с этим животным
//     4. Избавиться от кнопки возврата назад на экране результатов
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
    }

    private func calculatePersonalityResult() {
        var  frequencyOfAnswerd: [Animal: Int] = [:]

        for asa in responses {
            frequencyOfAnswerd[asa.animal] = (frequencyOfAnswerd[asa.animal] ?? 0) + 1
        }



        let eeer = frequencyOfAnswerd.sorted ( by: {(pair1, pair2) -> Bool  in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = eeer.first!.key
        
        resultIconLabel.text = " Вы - \(mostCommonAnswer.rawValue)!"
        resultTextLabel.text = mostCommonAnswer.definition
    }

}
    

