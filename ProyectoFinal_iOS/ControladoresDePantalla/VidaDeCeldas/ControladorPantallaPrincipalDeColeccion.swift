//
//  ControladorPantallaPrincipalDeColeccion.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 11/11/24.
//

import UIKit

// private let identificador_de_celda = "celda_pantalla_principal"

class ControladorPantallaPrincipalDeColeccion: UICollectionViewController{
    
    private var lista_de_monstruos: [Monstruo] = []
    
    private let identificador_de_celda = "celda_pantalla_principal"
    
    let proveedor_monstruos = ProveedorDeMonstruos.autoreferencia
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("Hola")
        proveedor_monstruos.obtener_monstruos{
            [weak self] (monstruos) in self?.lista_de_monstruos = monstruos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lista_de_monstruos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeZelda = collectionView.dequeueReusableCell(withReuseIdentifier: identificador_de_celda, for: indexPath) as! VistaDeZelda
        
        celda.nombre.text = self.lista_de_monstruos[indexPath.item].name
        celda.tipo.text = self.lista_de_monstruos[indexPath.item].type
        celda.especie.text = self.lista_de_monstruos[indexPath.item].species
        celda.descripcion.text = self.lista_de_monstruos[indexPath.item].description
        
        
        return celda
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se selecciono la celda\(indexPath)")
        
        let pantalla_de_monstruo = storyboard?.instantiateViewController(withIdentifier: "PantallaMonstruo") as! ControladorPantallaDelMonstruo
        
        pantalla_de_monstruo.id_monstruo = self.lista_de_monstruos[indexPath.item].id
        
        self.navigationController?.pushViewController(pantalla_de_monstruo, animated: true)
    }
    
}
