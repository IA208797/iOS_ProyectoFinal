//
//  EstiloCellViewControllerCelular.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 21/11/24.
//

import UIKit

extension ControladorPantallaPrincipalDeColeccion: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Ancho de la celda como la mitad del ancho de la colección
        let ancho = collectionView.frame.width / 1.28
        
        // Altura proporcional al ancho de la celda
        let largo = ancho / 3  // Esto da una proporción
        
        return CGSize(width: ancho, height: largo)
    }
    
    // Modifica el inset de las vistas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Un margen fijo de 10 puntos, pero puedes ajustarlo si lo necesitas
        let margin = CGFloat(10)
        
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20  // Espacio entre filas
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Establece el espacio entre las celdas de una fila
        let numeroDeCeldasPorFila: CGFloat = 2  // O el número que prefieras
        let espacioDisponible = collectionView.frame.width - (numeroDeCeldasPorFila * 10) // Considera el margen
        let espaciado = espacioDisponible / (numeroDeCeldasPorFila + 1)
        return espaciado

    }

}

