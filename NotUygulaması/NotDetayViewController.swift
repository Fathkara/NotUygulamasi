//
//  NotDetayViewController.swift
//  NotUygulaması
//
//  Created by Fatih on 15.09.2022.
//

import UIKit

class NotDetayViewController: UIViewController {

    @IBOutlet weak var textfieldDersadi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    
    var not:Notlar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not {
            textfieldDersadi.text = n.ders_adi
            textfieldNot1.text = String(n.not1!)
            textfieldNot2.text = String(n.not2!)
        }
    }
    

    @IBAction func notSil(_ sender: Any) {
        if let n = not {
            Notlardao().notSil(not_id: n.not_id!)
        }
    }
    
    @IBAction func notGuncelle(_ sender: Any) {
        
        if let n = not, let ad = textfieldDersadi.text , let not1 = textfieldNot1.text, let not2 = textfieldNot2.text {
            if let n1 = Int(not1) , let n2 = Int(not2) {
                Notlardao().notGuncelle(ders_adi: ad, not1: n1, not2: n2, not_id: n.not_id!)
            }
        }
    }
}
