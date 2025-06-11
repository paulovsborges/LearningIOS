import UIKit

class LocktapStyle{
    
    class Colors{
        static let blue101727 = UIColor(red: 16, green: 23, blue: 39, alpha: 1)
    }
    
    class Fonts{
        private static let regular = "WixMadeforDisplay-Regular" // 400
        private static let medium = "WixMadeforDisplay-Medium" // 500
        private static let semiBold = "WixMadeforDisplay-SemiBold" // 600
        private static let bold = "WixMadeforDisplay-Bold" // 700
        private static let extraBold = "WixMadeforDisplay-ExtraBold" // 800
        
        static let regularS16W400 = UIFont(name: regular, size: 16)
    }
}

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
