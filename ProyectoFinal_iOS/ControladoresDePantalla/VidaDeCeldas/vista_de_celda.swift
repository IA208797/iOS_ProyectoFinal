//
//  vista_de_celda.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 11/11/24.
//

import UIKit

class VistaDeZelda: UICollectionViewCell{
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var especie: UILabel!
    //IBOutlet weak var descripcion: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Personaliza la celda aquí
            styleCell()
            addGradientBackground()
        
        }

        private func styleCell() {
            // Estilo general de la celda
            self.layer.cornerRadius = 10
            self.layer.masksToBounds = true
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.layer.shadowRadius = 5
        }
    

    // Función que agrega el gradiente a la celda
    private func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds  // Asegúrate de que el gradiente cubra toda la celda
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        // Agregar el gradiente como capa de fondo
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
