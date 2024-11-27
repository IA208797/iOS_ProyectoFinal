//
//  ControladorPantallaPrincipalDeArmas.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 26/11/24.
//

import UIKit

class ControladorPantallaPrincipalDeArmas: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    private var listaDeArmas: [Arma] = []
    private let identificadorDeCelda = "celda_arma"
    let proveedorDeArmas = ProveedorDeArmas.autoreferencia
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarArmas()
    }
    
    private func cargarArmas() {
        proveedorDeArmas.obtener_armas{ [weak self] (armas) in
            self?.listaDeArmas = armas
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeArmas.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeArma = collectionView.dequeueReusableCell(withReuseIdentifier: identificadorDeCelda, for: indexPath) as! VistaDeArma
        
        let arma = self.listaDeArmas[indexPath.item]

        celda.nombre.text = arma.name
        celda.tipo.text = arma.type.capitalized
        celda.rareza.text = "Rarity: " + String(arma.rarity)
        celda.ataque.text = "Attack: \(String(arma.attack!.display))"
        
        if let urlIcon = URL(string: arma.assets?.icon ?? "") {
            DispatchQueue.global().async {
                if let dataIcon = try? Data(contentsOf: urlIcon),
                   let imageIcon = UIImage(data: dataIcon) {
                    DispatchQueue.main.async {
                        celda.icono.image = imageIcon
                    }
                }   else {
                    DispatchQueue.main.async {
                        celda.icono.image = UIImage(named: "placeholder")
                    }
                }
            }
        }   else {
            celda.icono.image = UIImage(named: "placeholder")
        }
        
        animateCellAppearance(cell: celda)
        
        return celda
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let armaSeleccionada = listaDeArmas[indexPath.item]
        
        let pantallaDeArma = storyboard?.instantiateViewController(withIdentifier: "PantallaArma") as! ControladorDePantallaDeArmas
        
        pantallaDeArma.id_arma = armaSeleccionada.id
        
        navigationController?.pushViewController(pantallaDeArma, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ancho = collectionView.frame.width
        return CGSize(width: ancho / 1.2, height: ancho / 2.6 )
    }
        
    func animateCellAppearance(cell: UICollectionViewCell) {
        cell.alpha = 0  // Comienza invisible
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseIn, animations: {
            cell.alpha = 1  // Hacerla visible con animación
        }, completion: nil)
    }
    
}
