//
//  ChineseViewController.swift
//  Vocabulary1207
//
//  Created by yaya on 2016/12/7.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class ChineseViewController: UIViewController {
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    
    
    
    var vocabulary = ""
    var sentence = ""
    var alphabet = ""
    

    @IBAction func showEnglish(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    } //返回英文頁
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    word.text = vocabulary
    sentenceLabel.text = sentence
    self.navigationItem.title = alphabet

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
