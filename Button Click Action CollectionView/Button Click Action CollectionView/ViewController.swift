//
//  ViewController.swift
//  Button Click Action CollectionView
//
//  Created by 이정찬 on 2022/07/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myCollectionView: UICollectionView!
    var itemList = [productList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1:productList=productList(productImage: UIImage(named: "Burger")!, porductName: "Creamy Macroni")
        itemList.append(item1)
        let item2:productList=productList(productImage: UIImage(named: "Burger")!, porductName: "Creamy Macroni")
        itemList.append(item2)
    }


}

