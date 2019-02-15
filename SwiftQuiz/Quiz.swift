//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Gabriel Guerrero on 2/15/19.
//  Copyright © 2019 Gabriel Guerrero. All rights reserved.
//

import Foundation

class Quiz {
    
    //MARK: - Var's
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    //MARK: - Constructor
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    //MARK: - Method's
    func validateOption(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctedAnswer
    }
    
    //MARK: - Deconstructor
    deinit {
        print("Liberou Quiz da memoria")
    }
}
