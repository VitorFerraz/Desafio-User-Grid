//
//  ViewController.swift
//  Desafio
//
//  Created by Vitor Ferraz on 26/07/17.
//  Copyright © 2017 Vitor. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class UserGridViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
  //MARK: -  Outlets
  
  @IBOutlet weak var nextBtn: UIButton!
  @IBOutlet weak var backBtn: UIButton!
  @IBOutlet weak var pagination: UIStackView!
  @IBOutlet weak var userCollectionView: UICollectionView!
  //MARK: -  Propriedades
 
  
 
  
  let reuseIdentifier = "UserCell"

  
  //MARK: -  ViewLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.backBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
     self.nextBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    api.makeRequest(completed: { 
      self.userCollectionView.reloadData()
      for i in 1...store.totalPages{
        let btn = self.makeButtonWithText(text: "\(i)")
        
        self.pagination.addArrangedSubview(btn)
        self.pagination.arrangedSubviews[0].backgroundColor = UIColor.red

      }
    }, page: 1)
    
    

  }




  
  
  // MARK: - UICollectionViewDataSource protocol
  
  // tell the collection view how many cells to make
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return store.userList.count
  }
  
  // make a cell for each cell index path
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    // get a reference to our storyboard cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as? UserCollectionViewCell

    cell?.configureCell(index: indexPath.row)
    return cell!
  }
  

  
  
  // MARK: - UICollectionViewDelegate protocol
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // handle tap events
    print("You selected cell #\(indexPath.item)!")
  }
  

  
  
  //MARK: -  Métodos
  func makeButtonWithText(text:String) -> UIButton {
    //Initalize a button
    let myButton = UIButton(type: UIButtonType.system)
    //Set a frame for the button. Ignored in AutoLayout/ Stack Views
    myButton.frame = CGRect(x: 30, y: 30, width: 150, height: 150)
    //Set background color
    myButton.backgroundColor = UIColor.blue
    //State dependent properties title and title color
    myButton.setTitle(text, for: .normal)
    myButton.setTitleColor(UIColor.white, for: .normal)
    
    myButton.tag = Int(text)!
    myButton.addTarget(self, action:#selector(changePage(sender:)), for: .touchUpInside)
    return myButton
  }
  
  func changePage(sender: UIButton){
    print("changed")
    store.currentPage = sender.tag-1
    for i in 0..<pagination.arrangedSubviews.count{
      if i == ( store.currentPage){
        pagination.arrangedSubviews[i].backgroundColor = UIColor.red
      }else{
         pagination.arrangedSubviews[i].backgroundColor = UIColor.blue
      }
     
      
    }
    
    store.currentPage = sender.tag
    api.makeRequest(completed: {
      self.userCollectionView.reloadData()
    }, page: store.currentPage)
  }
  //MARK: -  Actions

  @IBAction func btnChangePage(_ sender: UIButton) {
    let fakeBtn = UIButton()
    
    
    if sender.tag == 1{
      //volta
      
      fakeBtn.tag = store.currentPage - 1
      if fakeBtn.tag < 1{
        fakeBtn.tag = 1
      }
     
    }else if sender.tag == 4{
      //avanca
      fakeBtn.tag = store.currentPage + 1
      if fakeBtn.tag > store.totalPages{
        fakeBtn.tag = store.currentPage
      }
      
      
    }
    print("currentPage",store.currentPage)
    print("tag",fakeBtn.tag)
    changePage(sender: fakeBtn)
  }
  

  


  
  
}

