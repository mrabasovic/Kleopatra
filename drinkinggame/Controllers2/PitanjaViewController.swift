//
//  PitanjaViewController.swift
//  drinkinggame
//
//  Created by mladen on 16.3.21..
//

import UIKit
import CoreData

class PitanjaViewController: UIViewController {

    
    
    @IBOutlet weak var pitanjeTxt: UILabel!
    
    
    var pitanje = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //pitanje.procitajImena()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        promeniPitanje()

    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        promeniPitanje()
    }
    
    //let start = StartViewController()
    //let imena : [String] = start.imena

    func promeniPitanje(){
        pitanje.procitajImena()
        
        let velicinaNiza = pitanje.velicinaNizaPitanja //- 1
        let random = Int.random(in: 0...velicinaNiza)
        pitanjeTxt.text = pitanje.pitanjaNiz[random].tekst
    }
    
    
    
    
    
    
}
