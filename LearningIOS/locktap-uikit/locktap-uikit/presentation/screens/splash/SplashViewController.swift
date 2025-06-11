import UIKit

class SplashViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = LocktapStyle.Colors.blue101727
        
        setupAppLogo()
        
        Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(proceedToNextScreen),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func proceedToNextScreen() {
        let createPinViewController = CreatePinViewController()
        navigationController?.setViewControllers([createPinViewController], animated: false)
    }
}

extension SplashViewController{
    private func setupAppLogo(){
        
        let imageView = UIImageView(image: UIImage(named: "locktap_splash_logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
