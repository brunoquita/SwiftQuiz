//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Bruno Rocha on 06/08/21.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    
    @IBOutlet weak var lbQuestion: UILabel!
    
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (succes) in
            self.showResults()
            
        }
        
        getNewQuiz()
    }
    
    func getNewQuiz (){
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults(){
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewcontroler = segue.destination as! ResultViewController
        resultViewcontroler.totalAnswers = quizManager.totalAnswers
        resultViewcontroler.totalCorrectAnswers = quizManager.totalCorrectAnswers
        
        
    }
    
    
    @IBAction func selectAnswers(_ sender: UIButton) {
        
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    
    
}
