//
//  UsuarioService.swift
//  Tinder
//
//  Created by Renan de Castro Ribeiro on 19/10/20.
//  Copyright © 2020 Renan de Castro Ribeiro. All rights reserved.
//

import Foundation
class UsuarioService{

    static let shared = UsuarioService()
    
    let usuarios:[Usuario] = [
        Usuario(id: 101, idade: 20, name: "Maria Candida", frase: "O último a dar match chama", foto: "pessoa-1", match: true),
        Usuario(id: 102, idade: 24, name: "Debora Almeira", frase: "Nascida no interiorm e morando em São Paulo há seis anos.", foto: "pessoa-2", match: false),
        Usuario(id: 103, idade: 23, name: "Tamires Soares", frase: "Apenas networking", foto: "pessoa-3", match: false),
        Usuario(id: 104, idade: 24, name: "Joana Alfena", frase: "Geminiana, estudante de Psicologia e afim de uma boa conversa sobre tudo", foto: "pessoa-4", match: true),
        Usuario(id: 105, idade: 25, name: "Marcia Macata", frase: "Amo os animais e não curto sertanejo ... é isso", foto: "pessoa-5", match: true),
        Usuario(id: 106, idade: 23, name: "Larissa Rodrigues", frase: "caiçara feminista que acredita em astrologia", foto: "pessoa-6", match: false),
        Usuario(id: 107, idade: 20, name: "Barbará Castro", frase: "seila só qro ver se conheço umas pessoas legais", foto: "pessoa-7", match: false),
        Usuario(id: 108, idade: 21, name: "Lais", frase: "011", foto: "pessoa-8", match: true),
        Usuario(id: 109, idade: 23, name: "Isabela Rebeca", frase: "O último a dar match chama", foto: "pessoa-9", match: false),
        Usuario(id: 110, idade: 24, name: "Laura", frase: "Biomédica, ariana, catarinense perdida em SP", foto: "pessoa-10", match: true),
        Usuario(id: 111, idade: 25, name: "Amanda", frase: "Me fala de você", foto: "pessoa-11", match: false),
        Usuario(id: 112, idade: 24, name: "Alice", frase: "Designer, The office > Brooklin99 > friends", foto: "pessoa-12", match: true),
        Usuario(id: 113, idade: 24, name: "Nadine", frase: "Não procuro casual, nem fumante", foto: "pessoa-13", match: true),
        Usuario(id: 114, idade: 22, name: "Daniela", frase: "Sargitariana, filósofa de boteco, feliz !!", foto: "pessoa-14", match: false),
        Usuario(id: 115, idade: 21, name: "Esther", frase: "Gosto de tirar fotos e viajar procuro um crushzinho", foto: "pessoa-15", match: false),
        Usuario(id: 116, idade: 25, name: "Jessica Kato", frase: "Sai daqui bolsominion e hétero top.", foto: "pessoa-16", match: false),
        Usuario(id: 117, idade: 23, name: "Anna Rita", frase: "Viciada em esportes e viajar! Bora fazer uma trip", foto: "pessoa-17", match: true),
        Usuario(id: 118, idade: 23, name: "Natália", frase: "Paulista morando no Rio e procurando amigxs pra dar rolê de máscara", foto: "pessoa-18", match: true),
        Usuario(id: 119, idade: 23, name: "Marcela", frase: "good vibes only", foto: "pessoa-19", match: true),
        Usuario(id: 120, idade: 22, name: "Aruiane", frase: "Virginiana e apaixa por tudo relacionado ao universo", foto: "pessoa-20", match: true),
    ]
    
    func buscaUsuarios() ->[Usuario]{
        return self.usuarios
    }
}
