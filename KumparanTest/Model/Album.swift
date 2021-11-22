//
//  Album.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import Foundation

class Album: Codable {
    var albumId : Int?
    var id : Int?
    var title : String?
    var url : String?
    var thumbnailUrl : String?
    
    func getPhoto() -> URL {
        if thumbnailUrl != nil {
            return URL(string: thumbnailUrl!)!
        }else {
            return URL(string: "www.google.com")!
        }
    }
    
    
}
