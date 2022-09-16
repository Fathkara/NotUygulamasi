//
//  ViewController.swift
//  NotUygulaması
//
//  Created by Fatih on 15.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NotTableView: UITableView!
    
    var notlarListe = [Notlar]()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        NotTableView.delegate = self
        NotTableView.dataSource = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notlarListe = Notlardao().tumNotlarıAl()
        NotTableView.reloadData()
        
        var toplam = 0
        
        for n in notlarListe {
            toplam = toplam + (n.not1! + n.not2!)/2
        }
        if notlarListe.count != 0 {
            navigationItem.prompt = "Ortalama : \(toplam/notlarListe.count)"
        }else {
            navigationItem.prompt = "ortalama yök"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        if segue.identifier == "notDetay" {
            let gidilecekVC = segue.destination as! NotDetayViewController
            gidilecekVC.not = notlarListe[indeks!]
        }
        
    }
    
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "notlar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalancakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("notlar.sqlite")
        
        if fileManager.fileExists(atPath: kopyalancakYer.path) {
            print("veritabanı var")
            
        }else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalancakYer.path)
            } catch  {
                print(error.localizedDescription)
            }
            
        }
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notHucre", for: indexPath) as! NotHucreTableView
        cell.labelDersadi.text = not.ders_adi!
        cell.labelNot1.text = String(not.not1!)
        cell.labelNot2.text = String(not.not2!)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "notDetay", sender: indexPath.row)
    }
    
}

