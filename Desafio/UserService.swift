//
//  UserService.swift
//  Desafio
//
//  Created by Vitor Ferraz on 26/07/17.
//  Copyright © 2017 Vitor. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class UserService{
  var api  = APIManager()
  var image = [URL]()
  
 
  
  func getUsersList(result:JSON){
    
    store.totalPages = result["total_pages"].int!
    store.totalPerPages = result["per_page"].int!
    
    
    print("total teste \(store.totalPages)")
    
    for i in 0..<store.totalPerPages{
      let id = result["data"][i]["id"].intValue
      let nome = "\(result["data"][i]["first_name"].stringValue)"
      let sobreNome = "\(result["data"][i]["last_name"].stringValue)"
      let avatarURL = result["data"][i]["avatar"].url
      //let avatarImage = UIImage()
     
     
      var user = User(id: id, nome: nome, sobreNome: sobreNome, image: avatarURL!)
      store.userList.append(user)
      print("teste 4\(user)")
    }
    
  }
  
  
  
}
