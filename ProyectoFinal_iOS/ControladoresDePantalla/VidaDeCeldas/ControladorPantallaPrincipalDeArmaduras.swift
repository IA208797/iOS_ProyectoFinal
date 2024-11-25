//
//  ControladorPantallaPrincipalDeArmaduras.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//
import UIKit

class ControladorPantallaPrincipalDeArmaduras: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    private var listaDeArmaduras: [Armadura] = []
    private let identificadorDeCelda = "celda_armadura"
    let proveedorDeArmaduras = ProveedorDeArmaduras.autoreferencia
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarArmaduras()
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
        let celda: VistaDeArmadura = collectionView.dequeueReusableCell(withReuseIdentifier: identificadorDeCelda, for: indexPath) as! VistaDeArmadura
        
        let armadura = self.listaDeArmaduras[indexPath.item]
        celda.nombre.text = armadura.name
        
        celda.nombre.text = self.listaDeArmaduras[indexPath.item].name

        if let urlFemale = URL(string: armadura.assets?.imageFemale ?? "") {
            DispatchQueue.global().async {
                if let dataFemale = try? Data(contentsOf: urlFemale),
                   let imageFemale = UIImage(data: dataFemale) {
                    DispatchQueue.main.async {
                        celda.imagen.image = imageFemale
                    }
                } else {
                    DispatchQueue.main.async {
                        celda.imagen.image = UIImage(named: "placeholder")
                    }
                }
            }
        } else {
            celda.imagen.image = UIImage(named: "placeholder")
        }

        animateCellAppearance(cell: celda)
        
        return celda
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let armaduraSeleccionada = listaDeArmaduras[indexPath.item]
        
        let pantallaDeArmadura = storyboard?.instantiateViewController(withIdentifier: "PantallaArmadura") as! ControladorDePantallaDeArmaduras
        
        pantallaDeArmadura.id_armadura = armaduraSeleccionada.id
        
        navigationController?.pushViewController(pantallaDeArmadura, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Establece el tamaño deseado para cada celda
        let ancho = collectionView.frame.width
        return CGSize(width: ancho, height: ancho * 1.5) // Ancho y alto en puntos
    }
    
    func animateCellAppearance(cell: UICollectionViewCell) {
        cell.alpha = 0  // Comienza invisible
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseIn, animations: {
            cell.alpha = 1  // Hacerla visible con animación
        }, completion: nil)
    }
}
