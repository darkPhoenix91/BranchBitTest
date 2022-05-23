//
//  UserModel.swift
//  BranchBitTest
//
//  Created by Miguel Alejandro Arellano Mercado on 23/05/22.
//

import Foundation

struct UserModel {
    let name: String
    let description: String
    
    static func getList() -> [UserModel] {
        let list = [
            UserModel(name: "Camara", description: "Puedes seleccionar la camara"),
            UserModel(name: "Lista de empleados", description: "Obtiene una lista de empleados"),
            UserModel(name: "Nombre completo", description: "Muestra tu nombre completo"),
            UserModel(name: "Numero de Telefono", description: "Muestra tu numero de telefono"),
            UserModel(name: "Fecha de nacimiento", description: "Muestra tu fecha de nacimiento"),
            UserModel(name: "Sexo", description: "Muestra tu sexo"),
            UserModel(name: "Color favorito", description: "Muestra tu color favorito"),
        ]
        return (list)
        //return (list+list+list+list+list+list+list)
    }
}
