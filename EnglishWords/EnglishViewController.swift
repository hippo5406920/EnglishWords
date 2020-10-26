//
//  EnglishViewController.swift
//  Vocabulary1207
//
//  Created by yaya on 2016/12/7.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit
import AVFoundation

class EnglishViewController: UIViewController {

    var alphabet:String = ""
    var lineArray = [""]
    var array = [""]
    var vocabularIndex = 0 //第幾筆資料
    //我的最愛
    var isSelect=false
    var currentVoc: VocabularyCollection!
    var vocabularyFavs = [VocabularyCollection]()
    
    
    
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    @IBOutlet weak var wordButton: UIButton!
    @IBOutlet weak var speakerButton: UIButton!
    
    // MARK: 上一個/前一個 單字 & 例句
    @IBAction func prevBtn(_ sender: Any) {
        vocabularIndex -= 1
        if vocabularIndex < 0 {
            vocabularIndex = array.count-1
            //如果已經在第一行了～就秀最後一行
        }
        show()
    }
    
    // MARK: 下一個 單字 & 例句
    @IBAction func nextBtn(_ sender: Any) {
        vocabularIndex += 1
        if vocabularIndex > array.count-1 {
            vocabularIndex = 0
            //如果已經在第一行了～就秀第一行
        }
        show()
    }
    
    @IBAction func wordVocButton(_ sender: Any) {
        // 單字發音
        let wordAudio = AVSpeechUtterance(string: lineArray[0])
        let audio = AVSpeechSynthesizer()
        audio.speak(wordAudio)
    }
    
    @IBAction func speakButton(_ sender: Any) {
        
        // 例句發音
        let wordAudio = AVSpeechUtterance(string: lineArray[2])
        let audio = AVSpeechSynthesizer()
        audio.speak(wordAudio)
        
    }
    
    @IBAction func collectVoc(_ sender: Any) {
        
        // 我的最愛
        if isSelect==false{
        favButton.setImage(UIImage(systemName:"heart.fill"), for: .normal)
        isSelect=true
        }else{
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
       currentVoc=VocabularyCollection(enVoc: lineArray[0], chVoc: lineArray[1], enSentences: lineArray[2], chSentences: lineArray[3])
       
       vocabularyFavs.insert(currentVoc, at: 0)
        
       
        
       VocabularyCollection.saveToFile(vocabularyFavs: vocabularyFavs)
        
       saveToFileAlert()
        
        
    }
    
    
    
    //秀出單字跟句子的主程式
    func show(){
        let line = array[vocabularIndex]
        //顯示例句用 t 切割資料
        lineArray = line.components(separatedBy: "\t")
        let vocabulary = lineArray[0]   //單字
        let sentence = lineArray[2]     //例句
        word.text = vocabulary
        sentenceLabel.text = sentence

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = alphabet
        
        isSelect = false
        let path = Bundle.main.path(forResource: alphabet, ofType: "txt")
        
        let content = try! String(contentsOfFile: path!, encoding:String.Encoding.utf16) //接收路徑跟編碼
        
        array = content.components(separatedBy: "\n")//依斷行切割資料
        
        readFav()
        show()
       

        
        // Do any additional setup after loading the view.
    }
    
    
    func readFav(){
        if let vocabularyFavs = VocabularyCollection.readFromFile() {
        self.vocabularyFavs = vocabularyFavs
        }
    }
    
   func saveToFileAlert () {
        let controller = UIAlertController(title: "儲存成功", message: "已將單字收藏", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
//        let navController = segue.destination as! UINavigationController
        let navController = segue.destination as! UINavigationController
        let chiController = navController.topViewController as! ChineseViewController
        
        chiController.vocabulary = lineArray[1]
        chiController.sentence = lineArray[3]
        chiController.alphabet = alphabet
        
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
