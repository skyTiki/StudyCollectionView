//
//  ViewController.swift
//  SyogoTest
//
//  Created by 市毛隆俊 on 2022/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectedShogoLabel: UILabel!
    
    var shogoList = [
        "初心者",
        "中級者",
        "上級者",
        "マスター",
        "超上級者",
        "もう神です",
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.minimumLineSpacing = 16.0
        layout.minimumInteritemSpacing = 8.0
        collectionView.collectionViewLayout = layout
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shogoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShogoCell", for: indexPath) as! ShogoCollectionViewCell
        cell.nameLabel.text = "\(shogoList[indexPath.row])"
        cell.nameLabel.layer.cornerRadius = 10
        cell.nameLabel.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedShogoLabel.text = "\((collectionView.cellForItem(at: indexPath) as! ShogoCollectionViewCell).nameLabel.text!)"
    }
}
