//
//  NotHucreTableView.swift
//  NotUygulaması
//
//  Created by Fatih on 15.09.2022.
//

import UIKit

class NotHucreTableView: UITableViewCell {

    @IBOutlet weak var labelDersadi: UILabel!
    @IBOutlet weak var labelNot1: UILabel!
    @IBOutlet weak var labelNot2: UILabel!
    
    var notlar:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
