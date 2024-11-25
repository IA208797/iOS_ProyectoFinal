//
//  ProveedorArmaduras.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//

import Foundation
import UIKit

class ProveedorDeArmaduras{
    let url_de_armaduras = "https://mhw-db.com/"
    var lista_de_armaduras: [Armadura] = []
    
    static var autoreferencia = ProveedorDeArmaduras()
    
    private init() {}
    
    func obtener_armaduras(que_hacer_al_recibir: @escaping ([Armadura]) -> Void){
        let ubicación = URL(string: "\(url_de_armaduras)armor")!
        URLSession.shared.dataTask(with: ubicación) {
            (datos, respuesta, error) in do {
                if let armaduras_recibidas = datos{
                    let pruebas_de_interpretación_de_datos = try JSONDecoder().decode([Armadura].self, from: armaduras_recibidas)
                    
                    self.lista_de_armaduras = pruebas_de_interpretación_de_datos
                    que_hacer_al_recibir(pruebas_de_interpretación_de_datos)
                }
                else {
                    print(respuesta)
                }
            }   catch {
                print("Error - No se recibieron las armaduras: \(error) ")
            }
        }.resume()
    }
    
    func obtener_armadura(id: Int, que_hacer_al_recibir: @escaping (Armadura) -> Void) {
        let ubicación = URL(string: "\(url_de_armaduras)armor/\(id)")!
        URLSession.shared.dataTask(with: ubicación){
            (datos, respuesta, error) in do {
                if let armaduras_recibidas = datos {
                    let prueba_de_interpretación_de_datos = try JSONDecoder().decode(Armadura.self, from: armaduras_recibidas)
                    
                    que_hacer_al_recibir(prueba_de_interpretación_de_datos)
                }
                else {
                    print(respuesta)
                }
            }   catch {
                print("Error - Algo falló al mostrar la Armadura \(id)")
            }
        }.resume()
    }
    
    func realizar_subida_de_armaduras(armadura_nueva: Armadura) {
        let ubicación = URL(string: url_de_armaduras)!
        URLSession.shared.dataTask(with: ubicación){
            (datos, respuesta, error) in do {}
        }.resume()
    }
}
