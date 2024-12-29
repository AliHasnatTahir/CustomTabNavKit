//
//  CustomTabBarView.swift
//  PDF_Editor
//
//  Created by Dzine Media mini1 on 24/12/2024.
//


import UIKit

protocol CustomTabBarViewDelegate: AnyObject {
    func didSelectTab(index: Int)
}

class CustomTabBarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    weak var delegate: CustomTabBarViewDelegate?
    private var selectedIndex: Int = 0
    private var tabbar: [String] = []
    
    init(frame: CGRect, tabbarItems: [String]) {
        super.init(frame: frame)
        self.tabbar = tabbarItems
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.backgroundColor = .black
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TabbarCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TabbarCell")
        
        self.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabbar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabbarCell", for: indexPath) as? TabbarCell else {
            return UICollectionViewCell()
        }
        
        cell.nameLbl.text = tabbar[indexPath.item]
        
        if selectedIndex == indexPath.item {
            cell.selectedView.backgroundColor = .white.withAlphaComponent(0.3)
            cell.nameLbl.textColor = .white
            cell.image.image = UIImage(named: "selected\(tabbar[indexPath.item])")
        } else {
            cell.selectedView.backgroundColor = .clear
            cell.nameLbl.textColor = .black
            cell.image.image = UIImage(named: tabbar[indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        
        delegate?.didSelectTab(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / CGFloat(tabbar.count), height: self.frame.height)
    }
    
    func reloadData(index: Int) {
        selectedIndex = index
        collectionView.reloadData()
    }
}
