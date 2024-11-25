//
//  File.swift
//  ProyectoFinal_iOS
//
//  Created by alumno on 20/11/24.
//

import UIKit

class mod_navegador_principal: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        activar_navigation_bar(activar: false)
    }

    func activar_navigation_bar(activar: Bool){
        self.navigationBar.isHidden = !activar
    }
}
