//
//  Intent.swift
//  EmployeesApp
//
//  Created by Fernando on 05/11/23.
//

import Foundation
import RxSwift

class Intent {
    weak var viewController: ViewController?
    var reducer = Reducer()
    private let disposeBag = DisposeBag()
    
    public func onNext() {
        let newState = reducer.getNextState()
        presentNewApplicationState(newState: newState)
    }
    
    private func presentNewApplicationState(newState: ApplicationState) {
        mainStore.accept(newState)
    }
    
    // View/ViewController observing Store for states:
    public func bind(to viewController: ViewController) {
        self.viewController = viewController
        mainStore.subscribe { event in
            self.viewController?.update(with: event)
        }.disposed(by: disposeBag)
    }
}
