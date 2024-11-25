//
//  ControladorDePantallaDeArmaduras.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//

import UIKit

class ControladorDePantallaDeArmaduras: UIViewController{
    
    let proveedor_de_armaduras = ProveedorDeArmaduras.autoreferencia
    
    // Aquí van los outlel
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagenArmadura: UIImageView!
    
    public var id_armadura: Int?
    
    private var armadura: Armadura?
    
    private var armadura_descripción: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Si voy a cambiar el estilo, va aquí
        print("Ya vamos a descargar la información, bip bup bop")
        realizar_descarga_de_información()
    }
    
    func realizar_descarga_de_información(){
        // Verificando si ya se obtuvo la armadura
        if self.armadura == nil {
            print("¿Todo bien, amigo?")
            proveedor_de_armaduras.obtener_armadura(id: self.id_armadura ?? -1, que_hacer_al_recibir: {
                [weak self] (armadura) in 
                self?.armadura = armadura
                DispatchQueue.main.async {
                    self?.dibujar_armadura()
                    self?.realizar_descarga_de_información()
                }
            })
        }
        else if self.armadura == nil {
            print("¿Qué pasó compradre?")
            proveedor_de_armaduras.obtener_armadura(id: id_armadura ?? -1) {
                [weak self] armadura in self?.armadura = armadura
                DispatchQueue.main.async {
                    self?.actualizar_interfaz()
                }
            }
        }
    }
    
    func dibujar_armadura(){
        guard let armadura_actual = self.armadura else {
            return
        }
        //Aquí van las variables de las api y los textos a los que irán conectados
        nombre.text = armadura_actual.name
        
        // Cargamos la imagen desde la URL
        cargar_imagen_desde_URL(urlString: armadura_actual.assets.imageMale)
        
    }
    
    func cargar_imagen_desde_URL(urlString: String){
        guard let url = URL(string: urlString) else {
            print("No se validó la URL :c")
            return
        }
        
        // Realizamos la carga de la imagen de manera asincróna
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error en la carga de imagen: \(error)")
                return
                }
            // Para asegurarnos de que los datos sean válidados
            guard let data = data, let image = UIImage(data: data) else {
                print("Ya valió x.x")
                return
            }
            
            // En camino a actualizar la imagen
            DispatchQueue.main.async {
                self.imagenArmadura.image = image
            }
        }.resume()
     }
    
    func actualizar_interfaz(){
        
    }
}
