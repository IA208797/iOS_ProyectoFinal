//
//  ControladorPantallaPrincipalDeArmaduras.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//
import UIKit

class ControladorPantallaPrincipalDeArmaduras: UICollectionViewController {
    
    private var listaDeArmaduras: [Armadura] = []
    private let identificadorDeCelda = "celda_armadura"
    let proveedorDeArmaduras = ProveedorDeArmaduras.autoreferencia
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarVista()
        cargarArmaduras()
    }
    
    private func configurarVista() {
        // Configuración adicional, como layout o diseño de la colección
        collectionView.register(VistaDeArmadura.self, forCellWithReuseIdentifier: identificadorDeCelda)
    }
    
    private func cargarArmaduras() {
        proveedorDeArmaduras.obtener_armaduras { [weak self] (armaduras) in
            self?.listaDeArmaduras = armaduras
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeArmaduras.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: identificadorDeCelda, for: indexPath) as! VistaDeArmadura
        
        let armadura = listaDeArmaduras[indexPath.item]
        celda.nombre.text = armadura.name
        celda.tipo.text = armadura.type
        
        return celda
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let armaduraSeleccionada = listaDeArmaduras[indexPath.item]
        
        let pantallaDeArmadura = storyboard?.instantiateViewController(withIdentifier: "PantallaArmadura") as! ControladorPantallaDeArmadura
        
        pantallaDeArmadura.idArmadura = armaduraSeleccionada.id
        
        navigationController?.pushViewController(pantallaDeArmadura, animated: true)
    }
}
