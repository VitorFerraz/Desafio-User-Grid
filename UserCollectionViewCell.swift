////
//  UserCollectionViewCell.swift
//  Desafio
//
//  Created by Vitor Ferraz on 26/07/17.
//  Copyright © 2017 Vitor. All rights reserved.
//

import UIKit
import Kingfisher

class UserCollectionViewCell: UICollectionViewCell {
  
  
  //MARK: -  Outlets
  
  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var idUser: UILabel!
  @IBOutlet weak var userName: UILabel!
  
  //MARK: -  Propriedades
  
  
  //MARK: -  ViewLifeCycle
  
  
  //MARK: -  Métodos
  func configureCell(index:Int) {
    
 let nome = store.userList[index].nome
 let sobreNome = store.userList[index].sobreNome
   
    self.userName.text = "\(nome) \(sobreNome.characters[sobreNome.startIndex])"
    self.idUser.text = "\(store.userList[index].id)"
    self.userImage.kf.setImage(with: store.userList[index].image)
    self.userImage.layer.cornerRadius = self.userImage.frame.size.width / 2
    self.userImage.clipsToBounds = true
    self.userImage.layer.borderWidth = 3
    self.userImage.layer.borderColor = UIColor.black.cgColor
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()


  }
  
  //MARK: -  Actions
  
  

}


