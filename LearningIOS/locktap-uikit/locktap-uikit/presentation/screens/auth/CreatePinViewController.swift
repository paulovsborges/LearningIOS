import UIKit

class CreatePinViewController : UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = LocktapStyle.Colors.blue101727
    }
    
    private func text(font: UIFont?, text: String, t: Bool){
        
        let label = UILabel()
        
        label.text = text
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: t ? view.bottomAnchor : view.centerYAnchor, constant: -200)
        ])
    }
}
