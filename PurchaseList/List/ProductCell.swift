//
//  ProductCell.swift
//  PurchaseList
//
//  Created by Александр Карпенко on 26/03/2019.
//  Copyright © 2019 com.alexander. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let measureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        return label
    }()
    
    let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(productLabel)
        contentView.addSubview(measureLabel)
        contentView.addSubview(background)
        
        contentView.sendSubviewToBack(background)
 
        contentView.addConstraints(withFormat: "H:|-12-[v0(45)]-10-[v1]-12-|", views: imageView, productLabel)
        contentView.addConstraints(withFormat: "H:|-67-[v0]-12-|", views: measureLabel)
        contentView.addConstraints(withFormat: "V:|[v0(45)]", views: imageView)
        contentView.addConstraints(withFormat: "V:|-3-[v0]-3-[v1]", views: productLabel, measureLabel)
        
        contentView.addConstraints(withFormat: "H:|[v0]|", views: background)
        contentView.addConstraints(withFormat: "V:|[v0]|", views: background)
        
        
        background.layer.shadowOpacity = 1
        background.layer.shadowRadius = 5 / 2
        background.layer.shadowOffset = CGSize(width: 1, height: 1)
        background.layer.shadowColor = UIColor.black.cgColor
        
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: 0))
        shadowPath.addLine(to: CGPoint(x: 0, y: bounds.height))
        shadowPath.addLine(to: CGPoint(x: 0.5, y: bounds.height))
        shadowPath.addLine(to: CGPoint(x: 0.5, y: 0))
  
        shadowPath.addLine(to: CGPoint(x: bounds.width, y: 0))
        shadowPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        shadowPath.addLine(to: CGPoint(x: bounds.width - 0.5, y: bounds.height))
        shadowPath.addLine(to: CGPoint(x: bounds.width - 0.5, y: 0))
        
        background.layer.shadowPath = shadowPath.cgPath
        
        background.layer.shouldRasterize = true
        background.layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
