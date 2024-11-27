//
//  ProveedorArmas.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 26/11/24.
//

import Foundation
import UIKit

class ProveedorDeArmas{
    let url_de_armas = "https://mhw-db.com/"
    var lista_de_armas: [Arma] = []
    
    static var autoreferencia = ProveedorDeArmas()
    
    func obtener_armas(que_hacer_al_recibir: @escaping ([Arma]) -> Void){
        let ubicación = URL(string: "\(url_de_armas)weapons")!
        URLSession.shared.dataTask(with: ubicación) {
            (datos, respuesta, error) in do {
                if let armas_recibidas = datos{
                    let pruebas_de_interpretación_de_datos = try JSONDecoder().decode([Arma].self, from: armas_recibidas)
                    
                    self.lista_de_armas = pruebas_de_interpretación_de_datos
                    que_hacer_al_recibir(pruebas_de_interpretación_de_datos)
                }
                else {
                    print(respuesta)
                }
            }   catch {
                print("Error - No se recibieron las armas: \(error) ")
            }
        }.resume()
    }
    
    func obtener_arma(id: Int, que_hacer_al_recibir: @escaping (Arma) -> Void) {
        let ubicación = URL(string: "\(url_de_armas)weapons/\(id)")!
        URLSession.shared.dataTask(with: ubicación){
            (datos, respuesta, error) in do {
                if let armas_recibidas = datos {
                    let prueba_de_interpretación_de_datos = try JSONDecoder().decode(Arma.self, from: armas_recibidas)
                    
                    que_hacer_al_recibir(prueba_de_interpretación_de_datos)
                }
                else {
                    print(respuesta)
                }
            }   catch {
                print("Error - Algo falló al mostrar el Arma \(id)")
            }
        }.resume()
    }
    
    func realizar_subida_de_armas(arma_nueva: Arma) {
        let ubicación = URL(string: url_de_armas)!
        URLSession.shared.dataTask(with: ubicación){
            (datos, respuesta, error) in do {}
        }.resume()
    }
}
