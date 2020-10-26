//
//  FavTableViewCell.swift
//  EnglishWords
//
//  Created by CHEN on 2020/10/25.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    var indexPath:Int!
    
   
       
    @IBOutlet weak var chineseVoc: UILabel!
    @IBOutlet weak var vocabulary: UILabel!
    @IBOutlet weak var tapSpeaker: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapSpeaker(_ sender: UIButton) {
        
    
    }
    

}
