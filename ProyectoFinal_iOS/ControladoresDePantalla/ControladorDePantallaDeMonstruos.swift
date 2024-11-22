//
//  ControladorDePantallaDeMonstruos.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 11/11/24.
//

import UIKit

class ControladorPantallaDelMonstruo: UIViewController{
    
    let proveedor_monstruos = ProveedorDeMonstruos.autoreferencia
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var especie: UILabel!
    @IBOutlet weak var descripcion: UILabel!

    public var id_monstruo: Int?
    
    private var monstruo: Monstruo?
    
    private var monstruo_descripcion: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(activar: true)
        
        realizar_descarga_de_informacion()
    }
    func realizar_descarga_de_informacion(){
        if self.monstruo == nil {
            proveedor_monstruos.obtener_monstruo(id: self.id_monstruo ?? -1, que_hacer_al_recibir: {
                [weak self] (monstruo) in self?.monstruo = monstruo
                DispatchQueue.main.async {
                    self?.dibujar_monstruo()
                    self?.realizar_descarga_de_informacion()
                }
            })
        }
        else if self.monstruo == nil {
            proveedor_monstruos.obtener_monstruo(id: id_monstruo ?? -1) { [weak self] monstruo in
                self?.monstruo = monstruo
                DispatchQueue.main.async {
                    self?.actualizar_interfaz()
                }
            }
        }
    }
    
    func dibujar_monstruo(){
        guard let monstruo_actual = self.monstruo else {
            return
        }
        nombre.text = monstruo_actual.name
        tipo.text = monstruo_actual.type
        especie.text = monstruo_actual.species
       // descripcion.text = monstruo_actual.description
        
    }

    
    func dibujar_descripcion(){
        guard let descripcion_actual = self.monstruo else {
            return
        }
        descripcion.text = descripcion_actual.description
    }


    func actualizar_interfaz() {
        guard let monstruo = self.monstruo else { return }
        
        // Mostrar la información del monstruo en la interfaz
        nombre.text = monstruo.name
        tipo.text = monstruo.type
        especie.text = monstruo.species
        descripcion.text = monstruo.description // Mostrar la descripción
    }
    
}
