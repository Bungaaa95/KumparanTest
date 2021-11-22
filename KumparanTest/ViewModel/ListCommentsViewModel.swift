//
//  ListCommentsViewModel.swift
//  KumparanTest
//
//  Created by Hayden Lui on 17/11/21.
//

import Foundation


class ListCommentsViewModel {
    
    var comments : [Comments] = []
    
    func getListComment(comp : @escaping ([Comments]) -> ()) {
           let api = URL(string: "https://jsonplaceholder.typicode.com/comments")!
           
           URLSession.shared.dataTask(with: api) {data, response , error in
               if error != nil {
                   print(error!.localizedDescription)
                   return
               }
               do {
                   let result = try JSONDecoder().decode([Comments].self, from: data!)
                comp(result)
               } catch {
                   
               }
           }.resume()
       }
}
