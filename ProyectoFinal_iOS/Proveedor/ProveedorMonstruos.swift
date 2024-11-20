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
    
    /*
    static var autoreferencia: ProveedorDeMonstruos = {
        // Esta version es solo para añadir configuracion o cosas importatnes durante la inicializacion
        let instancia = ProveedorDeMonstruos()
        return instancia
    }()
     */
    static var autoreferencia = ProveedorDeMonstruos()
    
    private init() {}
    
    func obtener_monstruos(que_hacer_al_recibir: @escaping ([Monstruo]) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_monstruos)monsters")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let monstruos_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Monstruo].self, from: monstruos_recibidas)
                        
                        self.lista_de_monstruos = prueba_de_interpretacion_de_datos
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta as Any)
                    }
                } catch {
                    print("Error")
                }
        }.resume()
    }
    
    func obtener_monstruo(id: Int, que_hacer_al_recibir: @escaping (Monstruo) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_monstruos)posts/\(id)")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let monstruos_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Monstruo.self, from: monstruos_recibidas)
                        
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta as Any)
                    }
                } catch {
                    print("Error")
                }
        }.resume()
    }
    
    func realizar_subida_de_monstruo(monstruo_nueva: Monstruo) {
        // func obtener_monstruos() async throws -> [Monstruo] {
        let ubicacion = URL(string: url_de_monstruos)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
        
    }
    
    /*
    
    func obtener_usuario(id: Int, que_hacer_al_recibir: @escaping (Usuario) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_monstruos)users/\(id)")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let monstruos_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Usuario.self, from: monstruos_recibidas)
                        
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error :)")
                }
        }.resume()
    }

    func obtener_comentarios_en_monstruo(id: Int, que_hacer_al_recibir: @escaping ([Comentario]) -> Void) {
        /// Acmodamos la url para descargar en esta funcion los post directamente
        let ubicacion = URL(string: "\(url_de_monstruos)posts/\(id)/comments")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let monstruos_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Comentario].self, from: monstruos_recibidas)
                        
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error")
                }
        }.resume()
    }
     */
}
