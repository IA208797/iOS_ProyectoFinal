//
//  VistaDeArmadura.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 25/11/24.
//

import UIKit

class VistaDeArmadura: UICollectionViewCell {

    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
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
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor(hex: "#A8E6CF").cgColor,
            UIColor(hex: "#34A853").cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        // Agregar el gradiente como capa de fondo
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
