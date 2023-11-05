//
//  Store.swift
//  EmployeesApp
//
//  Created by Fernando on 05/11/23.
//

import Foundation
import RxSwift
import RxCocoa

// Single source of truth

var mainStore: BehaviorRelay<State> = BehaviorRelay<State>(value: initialState())
