import SwiftUI

extension Color {
    static let primaryTeal = Color(red: 0.08, green: 0.47, blue: 0.45) // ~#147774
    static let accentOrange = Color(red: 1.00, green: 0.45, blue: 0.20) // ~#FF7333
    static let backgroundGray = Color(red: 0.96, green: 0.96, blue: 0.96)
    static let multipleGreen = Color(red: 0.0, green: 0.5, blue: 0.5) // #008080


}


extension Font {
    static func AppFont(_ size: CGFloat) -> Font {
        .custom("Capriola-Regular", size: size)
    }
}
