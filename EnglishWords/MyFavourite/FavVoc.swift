//
//  FavVoc.swift
//  a-z
//
//  Created by guowei on 2020/8/31.
//  Copyright © 2020 guowei. All rights reserved.
//

import Foundation

struct VocabularyCollection:Codable {
    var enVoc:String
    var chVoc:String
    var enSentences:String
    var chSentences:String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //Plist儲存資料
    static func saveToFile(vocabularyFavs: [VocabularyCollection]) {
           let propertyEncoder = PropertyListEncoder()
           if let data = try? propertyEncoder.encode(vocabularyFavs) {
               let url = VocabularyCollection.documentsDirectory.appendingPathComponent("vocabularyFav")
               try? data.write(to: url)
           }
       }
    static func readFromFile () -> [VocabularyCollection]? {
        let propertyDecoder = PropertyListDecoder()
        let url = VocabularyCollection.documentsDirectory.appendingPathComponent("vocabularyFav")
        if let data = try? Data(contentsOf: url), let vocabularyFavs = try?
            propertyDecoder.decode([VocabularyCollection].self, from: data) {
            return vocabularyFavs
        }else {
            return nil
        }
    }
}
