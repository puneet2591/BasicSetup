//
//  Font.swift
//  Pods
//
//  Created by Puneet Mahajan on 16/06/20.
//

/**
    Enum for generic Font
    
    If you want to use custom font then call 'func getCustomFont(name: String, ofSize: CGFloat)' method.
    'param' fontName(String), size(CGFloat)
 
    Note: Just make sure that you have added font files in your project else it will return default system font.
 
    If you want to use default fonts. Just call Font.Light.getFontOf(size: CGFloat) method
    'param' size(CGFloat)
 */

import Foundation

public enum Font {
    
    //public static var shared = Font()
    //private init() { }
    
    //public static var font: UIFont?
    
    case Light
    case Bold
    case Semibold
    case Regular
    case Medium
    
//    enum MyFont {
//        case Light
//        case Bold
//        case Semibold
//        case Regular
//        case Medium
//    }
    
    public func getFontOf(size: CGFloat) -> UIFont {
        
        switch self {
        case .Light:
            
            switch UIDevice.current.modelName {
            case .iPhone8, .iPhone8Plus, .iPhone7, .iPhone7Plus, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone11Pro, .iPhoneX:
                
                return UIFont.systemFont(ofSize: size - 2, weight: .light)
            default:
                if UIDevice.isIPad {
                    return UIFont.systemFont(ofSize: size + 2, weight: .light)
                }
                return UIFont.systemFont(ofSize: size, weight: .light)
            }
            
            
        case .Bold:
            
            switch UIDevice.current.modelName {
            case .iPhone8, .iPhone8Plus, .iPhone7, .iPhone7Plus, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone11Pro, .iPhoneX:
                
                return UIFont.systemFont(ofSize: size - 2, weight: .bold)
            default:
                if UIDevice.isIPad {
                    return UIFont.systemFont(ofSize: size + 2, weight: .bold)
                }
                return UIFont.systemFont(ofSize: size, weight: .bold)
            }
            
            
            
        case .Semibold:
            
            switch UIDevice.current.modelName {
            case .iPhone8, .iPhone8Plus, .iPhone7, .iPhone7Plus, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone11Pro, .iPhoneX:
                
                return UIFont.systemFont(ofSize: size - 2, weight: .semibold)
            default:
                
                if UIDevice.isIPad {
                    return UIFont.systemFont(ofSize: size + 2, weight: .semibold)
                }
                return UIFont.systemFont(ofSize: size, weight: .semibold)
            }
            
            
        case .Regular:
            
            switch UIDevice.current.modelName {
            case .iPhone8, .iPhone8Plus, .iPhone7, .iPhone7Plus, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone11Prom, .iPhoneX:
                
                return UIFont.systemFont(ofSize: size - 2, weight: .regular)
            default:
                
                if UIDevice.isIPad {
                    return UIFont.systemFont(ofSize: size + 2, weight: .regular)
                }
                return UIFont.systemFont(ofSize: size, weight: .regular)
            }
            
            
        case .Medium:
            
            switch UIDevice.current.modelName {
            case .iPhone8, .iPhone8Plus, .iPhone7, .iPhone7Plus, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone11Pro, .iPhoneX:
                
                return UIFont.systemFont(ofSize: size - 2, weight: .medium)
            default:
                if UIDevice.isIPad {
                    return UIFont.systemFont(ofSize: size + 2, weight: .medium)
                }
                return UIFont.systemFont(ofSize: size, weight: .medium)
            }
            
            
        }
        
    }
    
    public func getCustomFont(name: String, ofSize: CGFloat) -> UIFont {
        
        switch UIDevice.current.modelName {
        case .iPhone8, .iPhone8Plus, .iPhone7, .iPhone7Plus, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone11Pro, .iPhoneX:
            
            return UIFont(name: name, size: ofSize - 2) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
        default:
            if UIDevice.isIPad {
                return UIFont(name: name, size: ofSize + 2) ?? UIFont.systemFont(ofSize: ofSize + 2, weight: .medium)
            }
            return UIFont(name: name, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
        }
        
    }
}

/**
    If you are using custom font then conform to this protocol and get it implemented
*/

public protocol FontProtocol {
    
    func getFontOf(size: CGFloat) -> UIFont
}
