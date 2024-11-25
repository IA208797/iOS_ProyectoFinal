//
//  ProveedorMonstruos.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 11/11/24.
//

import Foundation
import UIKit

class ProveedorDeMonstruos{
    let url_de_monstruos = "https://mhw-db.com/"
    var  lista_de_monstruos: [Monstruo] = []
    
    static var autoreferencia = ProveedorDeMonstruos()
    
    private init() {}
    
    func obtener_monstruos(que_hacer_al_recibir: @escaping ([Monstruo]) -> Void) {
        let ubicacion = URL(string: "\(url_de_monstruos)monsters")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let monstruos_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Monstruo].self, from: monstruos_recibidas)
                        
                        self.lista_de_monstruos = prueba_de_interpretacion_de_datos
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error - No se recibieron los monstruos")
                }
        }.resume()
    }
    
    func obtener_monstruo(id: Int, que_hacer_al_recibir: @escaping (Monstruo) -> Void) {
        let ubicacion = URL(string: "\(url_de_monstruos)monsters/\(id)")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let monstruos_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Monstruo.self, from: monstruos_recibidas)
                        
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error - Algo falló al mostrar al Monstruo \(id)")
                }
        }.resume()
    }
    
    func realizar_subida_de_monstruo(monstruo_nueva: Monstruo) {
        let ubicacion = URL(string: url_de_monstruos)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
    }
}
