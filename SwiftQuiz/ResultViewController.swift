//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Gabriel Guerrero on 2/15/19.
//  Copyright © 2019 Gabriel Guerrero. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //MARK: - @IBOutlet's
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - @IBAction's
    @IBAction func closeClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Var's
    var totalCorrectedAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answersLabel.text = "Perguntas respondidas: \(self.totalAnswers)"
        self.correctLabel.text = "Perguntas corretas: \(self.totalCorrectedAnswers)"
        self.wrongLabel.text = "Perguntas erradas: \(self.totalAnswers - self.totalCorrectedAnswers)"
        
        let score = self.totalCorrectedAnswers * 100 / self.totalAnswers
        
        self.scoreLabel.text = "\(score)%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
