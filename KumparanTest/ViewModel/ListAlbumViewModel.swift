//
//  ListAlbumViewModel.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import Foundation

class AlbumViewModel {
    
    var albums : [Album] = []
    
    func getAlbums(comp : @escaping ([Album]) -> ()) {
           let api = URL(string: "https://jsonplaceholder.typicode.com/photos")!
           
           URLSession.shared.dataTask(with: api) {data, response , error in
               if error != nil {
                   print(error!.localizedDescription)
                   return
               }
               do {
                   let result = try JSONDecoder().decode([Album].self, from: data!)
                comp(result)
               } catch {
                   
               }
           }.resume()
       }
}
