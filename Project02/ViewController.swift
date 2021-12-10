//
//  ViewController.swift
//  Project02
//
//  Created by omari on 2/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Button01: UIButton!
    @IBOutlet var Button02: UIButton!
    @IBOutlet var Button03: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer : Int = 0
    var nbrTimesShuff : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria",
        "poland","russia","spain","uk","us"]
       
         Button01.layer.borderWidth = 1
         Button02.layer.borderWidth = 1
         Button03.layer.borderWidth = 1
        
        Button01.layer.borderColor = UIColor.lightGray.cgColor
        Button02.layer.borderColor = UIColor.lightGray.cgColor
        Button03.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestions()
    }
    
  
    
    func askQuestions(action : UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        Button01.setImage(UIImage(named: countries[0]), for: .normal)
        Button02.setImage(UIImage(named: countries[1]), for: .normal)
        Button03.setImage(UIImage(named: countries[2]), for: .normal)
        
            title = "Question: \(nbrTimesShuff)   " + countries[correctAnswer].uppercased() + "   your score:\(score.description)"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if  nbrTimesShuff <= 9 {
          if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            nbrTimesShuff += 1
        } else {
            title = "Wrong, this flag is for  :\(countries[sender.tag])"
            score -= 1
            nbrTimesShuff += 1
        }
        let ac = UIAlertController(title: title, message: "your score is \(score)", preferredStyle: .alert)
               ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
               present(ac, animated: true)
        
        
        } else if nbrTimesShuff > 9 {
            let finalAc = UIAlertController(title: "Game Over", message: "you finished the game", preferredStyle: .alert)
            finalAc.addAction(UIAlertAction(title: "Finish", style: .default, handler: nil))
            present(finalAc, animated: true)
            Button01.isEnabled = false
            Button02.isEnabled = false
            Button03.isEnabled = false
            score = 0
//            nbrTimesShuff = 1
            
        }
//        else if nbrTimesShuff > 10 {
//            score = 0
//            nbrTimesShuff = 11
//           }
        
       
    }
    
    @objc func showScore(){
     
        let vc = UIActivityViewController(activityItems: [score.description], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}

