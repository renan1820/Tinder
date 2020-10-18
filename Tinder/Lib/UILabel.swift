//
//  UILabel.swift
//  Tinder
//
//  Created by Renan de Castro Ribeiro on 18/10/20.
//  Copyright © 2020 Renan de Castro Ribeiro. All rights reserved.
//

import UIKit

extension UILabel{
    static func textLabel (_ size: CGFloat, textColor: UIColor = .black, numberLines: Int = 1) -> UILabel{
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberLines
        
        return label
    }
    
    static func textBoldLabel (_ size: CGFloat, textColor: UIColor = .black, numberLines: Int = 1) -> UILabel{
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberLines
        
        return label
    }
    
    func adicionarShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = true
        
    }
}
