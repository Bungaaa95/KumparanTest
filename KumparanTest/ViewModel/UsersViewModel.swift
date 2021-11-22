//
//  UsersViewModel.swift
//  KumparanTest
//
//  Created by Hayden Lui on 08/11/21.
//

import Foundation

class UsersViewModel {
    
    var users : [Users] = []
    
    func getUsers(comp : @escaping ([Users]) -> ()) {
           let api = URL(string: "https://jsonplaceholder.typicode.com/users")!
           
           URLSession.shared.dataTask(with: api) {data, response , error in
               if error != nil {
                   print(error!.localizedDescription)
                   return
               }
               do {
                   let result = try JSONDecoder().decode([Users].self, from: data!)
                comp(result)
               } catch {
                   
               }
           }.resume()
       }

}
