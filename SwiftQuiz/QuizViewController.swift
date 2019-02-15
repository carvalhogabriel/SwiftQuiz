//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Gabriel Guerrero on 2/15/19.
//  Copyright © 2019 Gabriel Guerrero. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //MARK: - @IBOutlet's
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButtonCollection: [UIButton]!
    
    //MARK: - @IBAction's
    @IBAction func selectAnswerClick(_ sender: UIButton) {
        let index = self.answersButtonCollection.index(of: sender)!
        self.quizManager.validateAnswer(index: index)
        self.getNewQuiz()
    }
    
    //MARK: - Var's
    let quizManager = QuizManager()
    
    //MARK: - Method's
    private func getNewQuiz() {
        self.quizManager.refreshQuiz()
        self.questionLabel.text = self.quizManager.question
        
        for i in 0..<self.quizManager.options.count {
            let option = self.quizManager.options[i]
            self.answersButtonCollection[i].setTitle(option, for: .normal)
        }
    }
    
    private func showResults() {
        self.performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.timerView.frame.size.width = self.view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.timerView.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        self.getNewQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = self.quizManager.totalAnswers
        resultViewController.totalCorrectedAnswers = self.quizManager.totalCorrectedAnswers
    }
    
}
