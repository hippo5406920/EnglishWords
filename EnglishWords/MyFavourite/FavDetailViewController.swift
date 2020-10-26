//
//  FavDetailViewController.swift
//  EnglishWords
//
//  Created by CHEN on 2020/10/25.
//

import UIKit
import AVFoundation

class FavDetailViewController: UIViewController {

    @IBOutlet weak var vocSentence: UILabel!
    @IBOutlet weak var vocDetailLabel: UILabel!
    @IBOutlet weak var chineseSentance: UILabel!
    @IBOutlet weak var chineseVoc: UILabel!
    
    var lineArray = [""]
    var array = [""]
    var vocabularIndex = 0 //第幾筆資料
    var currentVoc: VocabularyCollection!
    var vocabularyFavs = [VocabularyCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        show()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func speakVoc(_ sender: Any) {
        let speakVoc = AVSpeechUtterance(string: vocabularyFavs[vocabularIndex].enVoc)
        let audio = AVSpeechSynthesizer()
        audio.speak(speakVoc)
    }
    
    @IBAction func switchToShowChinese(_ sender: UISwitch) {
        if sender.isOn{
            chineseVoc.isHidden = false
            chineseSentance.isHidden = false
        }else{
            chineseVoc.isHidden = true
            chineseSentance.isHidden = true
        }
    }
    

    @IBAction func speakSentence(_ sender: Any) {
        let speakSentence = AVSpeechUtterance(string: vocabularyFavs[vocabularIndex].enSentences)
        let audio = AVSpeechSynthesizer()
        audio.speak(speakSentence)
    }
    
    @IBAction func nextVoc(_ sender: Any) {
        vocabularIndex += 1
        if vocabularIndex > vocabularyFavs.count-1{
            vocabularIndex=0
    }
        show()
    }
    
    @IBAction func backIndex(_ sender: Any) {
        vocabularIndex -= 1
        if vocabularIndex < 0 {
            vocabularIndex = vocabularyFavs.count-1
        }
        show()
    }
    
    
    func show(){
        vocDetailLabel.text = vocabularyFavs[vocabularIndex].enVoc
        vocSentence.text = vocabularyFavs[vocabularIndex].enSentences
        chineseVoc.text = vocabularyFavs[vocabularIndex].chVoc
        chineseSentance.text = vocabularyFavs[vocabularIndex].chSentences
   
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
