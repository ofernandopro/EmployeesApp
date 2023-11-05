//
//  ViewController.swift
//  EmployeesApp
//
//  Created by Fernando on 05/11/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var slotLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    private var intent: Intent?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        intent = Intent()
        
        // Binding VC to Store as SST:
        intent?.bind(to: self)
        
        // Binding user interaction to Intent:
        bindNextButton()
    }

    public func update(with employee: Event<State>) {
        if let value = employee.element {
            employeeNameLabel.text = value.employee[value.index].name
            dateLabel.text = value.employee[value.index].date
            slotLabel.text = value.employee[value.index].slot
        }
    }
    
    func bindNextButton() {
        nextButton.rx.tap.bind {
            self.intent?.onNext()
        }.disposed(by: disposeBag)
    }

}

