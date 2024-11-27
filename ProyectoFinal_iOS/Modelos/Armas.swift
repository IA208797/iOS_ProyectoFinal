//
//  Armas.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 26/11/24.
//

struct Arma: Codable{
    var id: Int
    var name: String
    var type: String
    var rarity: Int
    var attack: Attack?
    var assets: Imagenes?
    
    struct Attack: Codable{
        var display: Int
        var raw: Int
    }
    
    struct Imagenes: Codable{
        var icon: String?
        var image: String?
    }
}
