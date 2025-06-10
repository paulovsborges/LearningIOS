import UIKit

class CreatePinViewController : UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = MyColors.blue101727
        
        let label = UILabel()
        
        label.text = "Create pin screen"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
