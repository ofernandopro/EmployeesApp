//
//  Reducer.swift
//  EmployeesApp
//
//  Created by Fernando on 05/11/23.
//

import Foundation
import RxSwift
import RxCocoa

// Reduction => Previous State + Result = New State

struct Reducer {
    func getNextState() -> ApplicationState {
        let currentAppState = mainStore.value
        return ApplicationState(employee: currentAppState.employee,
                                index: (currentAppState.index + 1) % currentAppState.employee.count)
    }
}
