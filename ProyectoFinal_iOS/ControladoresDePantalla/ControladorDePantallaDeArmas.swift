//
//  ControladorDePantallaDeArmas.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 26/11/24.
//

import UIKit

class ControladorDePantallaDeArmas: UIViewController{
    let proveedor_de_armas = ProveedorDeArmas.autoreferencia
    
    // Aquí tengo que poner los outlets
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var rareza: UILabel!
    @IBOutlet weak var ataque: UILabel!
    @IBOutlet weak var ataqueraw: UILabel!
    @IBOutlet weak var icono: UIImageView!
    @IBOutlet weak var imagen: UIImageView!
    
    
    @IBOutlet weak var stackviu: UIStackView!
    
    
    public var id_arma: Int?
    
    private var arma: Arma?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stackviu.layer.cornerRadius = 15
        stackviu.layer.masksToBounds = true
        stackviu.spacing = 18
        colorPalStackviu()
           
        let backgroundImagen = UIImage(named: "mhb7")
        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = backgroundImagen
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        self.view.insertSubview(imageView, at: 0)
        
        
        print("Ya vamos a descargar la información de armas, bip bup bop")
        realizar_descarga_de_información()
    }
    
    func realizar_descarga_de_información(){
        if self.arma == nil {
            print("Vamos bien")
            proveedor_de_armas.obtener_arma(id: self.id_arma ?? -1, que_hacer_al_recibir: {[weak self] (arma) in self?.arma = arma
                DispatchQueue.main.async {
                    self?.dibujar_arma()
                    self?.realizar_descarga_de_información()
                }
            })
        }
    }
    
    func dibujar_arma(){
        guard let arma_actual = self.arma else{
            return
        }
        
        nombre.text = arma_actual.name
        tipo.text = arma_actual.type.capitalized
        rareza.text = "Rarity: " + String(arma_actual.rarity)
        ataque.text = "Attack: " + String(arma_actual.attack!.display)
        ataqueraw.text = "Raw damage: " + String(arma_actual.attack!.raw)
        cargar_imagen_desde_URL(urlString: arma_actual.assets?.image ?? "Imagen No Disponible")
        cargar_icono_desde_URL(urlString: arma_actual.assets?.icon ?? "Icono No Disponible")
    }
    
    func cargar_imagen_desde_URL(urlString: String){
        guard let url = URL(string: urlString) else {
            print("'URL en silla de ruedas' - Valetín 2024")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error en la carga de icono: \(error)")
                return
            }
            
            guard let data = data, let imagen = UIImage(data: data) else {
                print("Llama")
                return
            }
            
            DispatchQueue.main.async {
                self.imagen.image = imagen
            }
        }.resume()
    }
    
    func cargar_icono_desde_URL(urlString: String){
        guard let url = URL(string: urlString) else {
            print("'URL en silla de ruedas' - Valetín 2024")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("Error en la carga de icono: \(error)")
                return
            }
            
            guard let data = data, let icono = UIImage(data: data) else {
                print("Llama")
                return
            }
            
            DispatchQueue.main.async {
                self.icono.image = icono
            }
        }.resume()
    }
    
    func colorPalStackviu() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = stackviu.bounds
        gradientLayer.colors = [UIColor(hex: "#121212").cgColor, UIColor(hex: "#B88B4A").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        stackviu.layer.insertSublayer(gradientLayer, at: 0)
    }
}
