//
//  User.swift
//  Desafio
//
//  Created by Vitor Ferraz on 26/07/17.
//  Copyright © 2017 Vitor. All rights reserved.
//

import UIKit

class User{
  //MARK: -  Propriedades
  var id:Int
  var nome:String
  var sobreNome:String
  var image:URL
  
  //MARK: -  Inicializador

  init(id:Int,nome:String,sobreNome:String,image:URL) {
    self.id = id
    self.nome = nome.capitalized
    self.sobreNome = sobreNome.capitalized

    self.image = image
  }

  //MARK: -  Métodos
  
}
