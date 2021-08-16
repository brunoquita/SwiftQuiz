//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Bruno Rocha on 06/08/21.
//

import Foundation

class Quiz {
    
    let question: String
    let option:[String]
    private let correctedAnswer: String
    
    init(question: String, option: [String], correctrdAnswer:String) {
        self.question = question
        self.option = option
        self.correctedAnswer = correctrdAnswer
    }
    
    func validateOption(_ index: Int) -> Bool{
        let answer = option[index]
        return answer == correctedAnswer
        
    }
    
    
}
