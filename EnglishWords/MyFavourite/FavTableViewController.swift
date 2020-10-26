//
//  FavTableTableViewController.swift
//  EnglishWords
//
//  Created by CHEN on 2020/10/25.
//

import UIKit
import AVFoundation

class FavTableViewController: UITableViewController {
    
//    var vocabularIndex = 0 //第幾筆資料
    var currentVoc: VocabularyCollection!
    
    var vocabularyFavs = [VocabularyCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let vocabularyFavs = VocabularyCollection.readFromFile() {
            self.vocabularyFavs = vocabularyFavs
            
        }
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let vocabularyFavs = VocabularyCollection.readFromFile() {
            self.vocabularyFavs = vocabularyFavs
            
        }
        tableView.reloadData()
        
    }
    
    
    
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabularyFavs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavTableViewCell", for: indexPath) as! FavTableViewCell
        
        currentVoc = vocabularyFavs[indexPath.row]
        
        cell.vocabulary.text=currentVoc.enVoc
        
        cell.chineseVoc.text=currentVoc.chVoc
        
        
        
        return cell
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    @IBAction func TapSpeaker(_ sender: UIButton) {
        
        //利用轉換座標判斷點到是底幾cell
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            
            let wordAudio = AVSpeechUtterance(string: vocabularyFavs[indexPath.row].enVoc)
            let audio = AVSpeechSynthesizer()
            audio.speak(wordAudio)
        }
        
        
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            vocabularyFavs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            VocabularyCollection.saveToFile(vocabularyFavs: vocabularyFavs)
        }
    }
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
   
    
     // MARK: - Navigation
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as? FavDetailViewController
        
        if let row = tableView.indexPathForSelectedRow?.row {
            
            controller?.currentVoc=vocabularyFavs[row]
            controller?.vocabularyFavs=vocabularyFavs
            controller?.vocabularIndex=row
        }
     }

}
