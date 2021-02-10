//
//  UIColorExtension.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 10/02/21.
//

import UIKit


enum ColorType {
    case liteGreyDisable // Addfunds BG Color disable && CC selected BG color
    case liteDarkDeSelection
    case liteBlue
    case darkBlue
    case liteSkyBlue
    case darkSkyBlue
    case liteDark
    case liteGreen
    case addFundsDisableTextColor // liteWhite
    case liteRed
    case liteOrange
    case yellowDark
    case blackDark
    case white
}

//enum RankColor{
//    case firstRank
//    case secondRank
//    case thirdRank
//    case defaultRank
//    func color() -> UIColor{
//        switch self {
//        case .firstRank:
//            return UIColor.init(hexString: "#EBA540", 1.0)
//        case .secondRank:
//            return UIColor.init(hexString: "#5FC4FA", 1.0)
//        case .thirdRank:
//            return UIColor.init(hexString: "#6FD5B7", 1.0)
//        case .defaultRank:
//            return UIColor.white//init(hexString: "#F0F0F0", alpha: 1.0)
//        }
//    }
//}

extension UIColor {
    convenience init(hex: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat((hex>>16)&0xFF)/255.0, green: CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat((hex)&0xFF)/255.0, alpha: CGFloat(255 * alpha) / 255)
    }
    
    convenience init(hexString: String, _ alpha: Double = 1.0) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * alpha) / 255)
    }
    
    internal convenience init(_ type: ColorType, _ alpha:Double = 1.0) {
        switch type {
        case .liteGreyDisable:
            self.init(hexString: "#34374A", alpha)
        case .liteDarkDeSelection:
            self.init(hexString: "#212330", alpha)
        case .liteDark:
            self.init(hexString: "#363636", alpha)
        case .liteGreen:
            self.init(hexString: "#57AE50", alpha)
        case .addFundsDisableTextColor:
            self.init(hexString: "#7C7C7C", alpha)
        case .liteRed:
            self.init(hexString: "#D32027", alpha)
        case .liteOrange:
            self.init(hexString: "#F38C43", alpha)
        case .yellowDark:
            self.init(hexString: "#F9C307", alpha)
        case .blackDark:
            self.init(hexString: "#13131C", alpha)
        case .liteBlue:
            self.init(hexString: "#0755B6", alpha)
        case .darkBlue:
            self.init(hexString: "#002653", alpha)
        case .liteSkyBlue:
            self.init(hexString: "#4586D6", alpha)
        case .darkSkyBlue:
            self.init(hexString: "#1655A3", alpha)
        case .white:
            self.init(hexString: "#FFFFFF", alpha)
        }
    }
}

