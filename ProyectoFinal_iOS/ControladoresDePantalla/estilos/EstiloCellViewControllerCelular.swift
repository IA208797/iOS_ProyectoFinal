//
//  EstiloCellViewControllerCelular.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 21/11/24.
//

import UIKit

extension ControladorPantallaPrincipalDeColeccion: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var ancho = self.collectionView.frame.width
        var largo = self.collectionView.frame.height
        
        ancho = ancho / 1.5
        largo = ancho * 0.8
        
        return CGSize(width: ancho, height: largo)
    }
    
    // Modifica el inset de las vistas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let margin = CGFloat(25)
    
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        var ancho = self.collectionView.frame.width
        ancho = ancho / 3.5
        
        return ancho
    }
}
