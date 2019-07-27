//  ___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa
    
final class ___VARIABLE_productName:identifier___Controller: BaseController {
    var viewModel: ___VARIABLE_productName:identifier___ViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutNavBar()
        layoutUI()
        startBind()
    }
    
    // MARK: Navbar
    
    private func layoutNavBar() {
        navigationItem.configure { [unowned self](n) in
            n.backBarButtonItem = UIBarButtonItem { b in
                b.rx.tap
                    .bind(to: self.viewModel.input.back)
                    .disposed(by: self.disposeBag)
            }
        }
    }

    // MARK: UI
    
    private func layoutUI() {
    }

    // MARK: Binding

    private func startBind() {
    }
}