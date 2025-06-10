import UIKit

extension UIColor {
    
    convenience init(red: Int, green:  Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            alpha: alpha
        )
    }
}

class MyColors{
    static let blue101727 = UIColor(red: 16, green: 23, blue: 39, alpha: 1)
}
