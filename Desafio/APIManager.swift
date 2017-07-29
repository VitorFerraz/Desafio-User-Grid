//
//  APIManager.swift
//  Desafio
//
//  Created by Vitor Ferraz on 26/07/17.
//  Copyright © 2017 Vitor. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

typealias DownloadComplete = () -> ()


 class APIManager{
  
  var URL = "https://reqres.in/api/users?page="
  var resultJson:JSON = []

  
  func makeRequest(completed: @escaping DownloadComplete,page:Int){
 //  func makeRequest(page:Int){

    let url = "\(URL)\(page)"
    print("URL \(url)")
    
    store.userList.removeAll()

    Alamofire.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        self.resultJson = JSON(value)
        print("JSON: \(String(describing: self.resultJson))")
        userService.getUsersList(result: self.resultJson)
       // self.getUsersList(result: self.jsonR!)
//        dump(store.userList)
//        self.userCollectionView.reloadData()
      case .failure(let err):
        print(err)
      
      }
         completed()
      
    }
    
  }
}
