//
//  CombineCardView.swift
//  Tinder
//
//  Created by Renan de Castro Ribeiro on 18/10/20.
//  Copyright © 2020 Renan de Castro Ribeiro. All rights reserved.
//

import UIKit

class CombineCardView: UIView {
    let fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pessoa-1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nomeLabel: UILabel = .textBoldLabel(32, textColor: .white)
    let idadeLabel: UILabel = .textLabel(28, textColor: .white)
    let fraseLabel: UILabel = .textLabel(18, textColor: .white, numberLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nomeLabel.text = "Ana Laura"
        nomeLabel.adicionarShadow()
        
        idadeLabel.text = "20"
        idadeLabel.adicionarShadow()
        
        fraseLabel.text = "O último a dar match chama"
        fraseLabel.adicionarShadow()
        
        addSubview(fotoImageView)
        
        fotoImageView.preencherSuperView()
        
        let nomeIdadeStackView = UIStackView(arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
        nomeIdadeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nomeIdadeStackView,fraseLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        addSubview(stackView)
        stackView.preencher(
            top: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 16, right: 16)
        )
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
