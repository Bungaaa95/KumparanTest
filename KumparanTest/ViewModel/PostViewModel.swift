//
//  PostViewModel.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import Foundation

class PostViewModel {
    var post : [Posts] = []
    
    func getPost(comp : @escaping ([Posts]) -> ()) {
           let api = URL(string: "https://jsonplaceholder.typicode.com/posts")!
           
           URLSession.shared.dataTask(with: api) {data, response , error in
               if error != nil {
                   print(error!.localizedDescription)
                   return
               }
               do {
                   let result = try JSONDecoder().decode([Posts].self, from: data!)
                comp(result)
               } catch {
                   
               }
           }.resume()
       }
}
