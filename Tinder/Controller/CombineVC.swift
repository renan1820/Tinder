//
//  CombineVC.swift
//  Tinder
//
//  Created by Renan de Castro Ribeiro on 18/10/20.
//  Copyright © 2020 Renan de Castro Ribeiro. All rights reserved.
//

import UIKit

enum Acao{
    case DISLIKE, LIKE, SUPERLIKE
}
class CombineVC: UIViewController {
    
    var perfilButton: UIButton = .iconMenu(named: "icone-perfil")
    var chatButton: UIButton = .iconMenu(named: "icone-chat")
    var logoButton: UIButton = .iconMenu(named: "icone-logo")
    
    var dislikeButton: UIButton = .iconFooter(named: "icone-deslike")
    var superlikeButton: UIButton = .iconFooter(named: "icone-superlike")
    var likeButton: UIButton = .iconFooter(named: "icone-like")
    
    var usuarios: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.systemGroupedBackground
        self.adicionarHeader()
        self.adicionarFooter()
        self.buscaUsuarios()
    }
    
    func buscaUsuarios(){
        self.usuarios = UsuarioService.shared.buscaUsuarios()
        self.adcionarCards()
    }
    
}
extension CombineVC{
    func adicionarHeader(){
        //getSafeArea
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top: CGFloat = window?.safeAreaInsets.top ?? 44
        
        let stackView = UIStackView(arrangedSubviews:  [ perfilButton, logoButton, chatButton])
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        stackView.preencher(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: .init(top: top, left: 16, bottom: 0, right: 16)
        )
    }
    func adicionarFooter(){
        let stackView = UIStackView(arrangedSubviews:  [ UIView(),dislikeButton, superlikeButton, likeButton, UIView()])
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        stackView.preencher(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 34, right: 16)
        )
        
        dislikeButton.addTarget(self, action: #selector(dislikeClick), for: .touchUpInside)
        superlikeButton.addTarget(self, action: #selector(superlikeClick), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeClick), for: .touchUpInside)
    }
}

extension CombineVC{
    func adcionarCards(){
        for usuario in usuarios {

            let card = CombineCardView()
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            
            card.center = view.center
            card.usuario = usuario
            card.tag = usuario.id
            
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handleCard))
            
            card.addGestureRecognizer(gesture)
            
            view.insertSubview(card, at: 0)
        }
    }
    
    func removerCard(card: UIView){
        card.removeFromSuperview()
        
        self.usuarios = self.usuarios.filter({ (usuario) -> Bool in
            return usuario.id != card.tag
        })
    }
    
    func verificarMatch(usuario: Usuario){
        if usuario.match{
            print("This is a Match!")
        }
    }
}

extension CombineVC{
    
    @objc func handleCard(_ gesture: UIPanGestureRecognizer){
        if let card = gesture.view as? CombineCardView{
            let point  = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngle * 5
                card.dislikeImageView.alpha = 0
            } else {
                card.dislikeImageView.alpha = -(rotationAngle * 5)
                card.likeImageView.alpha = 0
            }
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if gesture.state == .ended{
                
                if card.center.x > self.view.bounds.width + 50{
                    self.animarCard(rotateAngle: rotationAngle, acao: .LIKE)
                    return
                }
                
                if card.center.x < -50{
                    self.animarCard(rotateAngle: rotationAngle, acao: .DISLIKE)
                    return
                }
                
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    card.dislikeImageView.alpha = 0
                    card.likeImageView.alpha = 0

                }
            }
        }
    }
    
    @objc func superlikeClick(){
        self.animarCard(rotateAngle: 0, acao: .SUPERLIKE)
    }
    
    @objc func dislikeClick(){
        self.animarCard(rotateAngle: -0.4, acao: .DISLIKE)
    }
    
    @objc func likeClick(){
        self.animarCard(rotateAngle: +0.4, acao: .LIKE)
    }
    func animarCard(rotateAngle: CGFloat, acao: Acao){
        if let usuario = self.usuarios.first{
            for view in self.view.subviews{
                if  view.tag == usuario.id {
                    if let card = view as? CombineCardView{
                        let center: CGPoint
                        var like: Bool
                        
                        switch acao {
                        case .DISLIKE:
                            center = CGPoint(x:  card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            like = false
                        case .LIKE:
                            center = CGPoint(x:  card.center.x + self.view.bounds.width, y: card.center.y + 50)
                            like = true
                        
                        case .SUPERLIKE:
                            center = CGPoint(x: card.center.x, y: card.center.y - self.view.bounds.height)
                            like = true
                        }
                        
                        UIView.animate(withDuration: 0.2, animations: {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotateAngle)
                            
                            card.dislikeImageView.alpha = like == false ? 1 : 0
                            card.likeImageView.alpha = like == true ? 1 : 0

                        }, completion: { (_) in
                            if like{
                                self.verificarMatch(usuario: usuario)
                            }
                            self.removerCard(card: card)
                        })
                    }
                }
            }
        }
    }
}
