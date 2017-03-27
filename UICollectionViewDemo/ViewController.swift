//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Frank.Chen on 2017/3/27.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        // 設置cell相關屬性
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10) // section與section之間的距離
        layout.itemSize = CGSize(width: (self.view.frame.size.width - 30) / 2, height: 120) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(integerLiteral: 10) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: 10) // collectionView設定為縱向的話即「列」的間距、橫向則為「行」的間距
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal // 滑動方向，預設為垂直。注意若設為垂直，則cell的加入方式為由左至右，滿了才會換行；若是水平則由上往下，滿了才會換列
        
        self.myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
        self.myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
    }
    
    // MARK: - DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 26
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.brown
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("row: \(indexPath.row)")
    }
    
}

