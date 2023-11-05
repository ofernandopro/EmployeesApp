//
//  State.swift
//  EmployeesApp
//
//  Created by Fernando on 05/11/23.
//

import Foundation

protocol State {
    var employee: [Employee] {get}
    var index: Int {get}
}

struct initialState: State {
    var employee = [Employee(name: "Fernando", date: "05/06/2023", slot: "15h - 16h"),
                    Employee(name: "Joao", date: "19/06/2023", slot: "16h - 17h"),
                    Employee(name: "Maria", date: "01/03/2023", slot: "17h - 18h")]
    var index = 0
}

struct ApplicationState: State {
    var employee: [Employee]
    var index: Int
}
