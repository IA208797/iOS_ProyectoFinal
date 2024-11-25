//
//  Armadura.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//

struct Armadura: Codable{
    var id: Int
    var name: String
    var assets: Assets? // Esto es lo que nos permite utilizar una lista miembro dentro de la API
    
    struct Assets: Codable{
        var imageFemale: String?
    }
}
