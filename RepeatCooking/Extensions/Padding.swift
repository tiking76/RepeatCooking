import SwiftUI

enum Padding {
    /// 32px
    static let XXL: CGFloat = 32
    
    /// 24px
    static let XL: CGFloat = 24
    
    /// 16px
    static let L: CGFloat = 16
    
    /// 12px
    static let M: CGFloat = 12
    
    /// 8px
    static let S: CGFloat = 8
    
    /// 4px
    static let XS: CGFloat = 4
    
    /// 0ox
    static let Zero: CGFloat = 0
}

enum ButtonSize {
    case slim, medium, large
}

extension Padding {
    static func buttonEdgeInsets(from size: ButtonSize) -> EdgeInsets {
        var horizontal: CGFloat {
            switch size {
            case .slim:
                return 12
            case .medium:
                return 16
            case .large:
                return 20
            }
        }
        var vertical: CGFloat {
            switch size {
            case .slim:
                return 8
            case .medium:
                return 12
            case .large:
                return 16
            }
        }
        return EdgeInsets(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}

