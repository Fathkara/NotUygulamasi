//
//  NotEkleViewController.swift
//  NotUygulaması
//
//  Created by Fatih on 15.09.2022.
//

import UIKit

class NotEkleViewController: UIViewController {

    @IBOutlet weak var textfieldDersadi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ekleButton(_ sender: Any) {
        if let ad = textfieldDersadi.text , let not1 = textfieldNot1.text, let not2 = textfieldNot2.text {
            if let n1 = Int(not1) , let n2 = Int(not2) {
                Notlardao().notKayit(ders_adi: ad, not1: n1, not2: n2)
            }
        }
    }
    

}
