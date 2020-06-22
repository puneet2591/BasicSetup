//
//  Extension+UITableView.swift
//  BasicSetup
//
//  Created by Puneet Mahajan on 19/03/20.
//  Copyright © 2020 Puneet Mahajan. All rights reserved.
//

import UIKit

/**
    Use this tableview extension and use xib file
 */

public extension UITableView {
    
    func getReusableCellof<T : UITableViewCell>(type: T.Type, forIndexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: String(describing: "\(type)"), for: forIndexPath) as? T
    }
    
    func getReusableHeaderof<T : UITableViewHeaderFooterView>(type: T.Type) -> T? {
        
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: "\(type)")) as? T
    }
    
    func cellForRowAt<T : UITableViewCell>(indexPath: IndexPath, type: T.Type) ->  T? {
        cellForRow(at: indexPath) as? T
    }
    
    func registerCellOf<T: UITableViewCell>(type: T.Type) {
        tableFooterView = UIView()
        register(UINib(nibName: String(describing: "\(type)"), bundle: nil), forCellReuseIdentifier: String(describing: "\(type)"))
    }
    
    func registerHeaderOf<T: UITableViewHeaderFooterView>(type: T.Type) {
        
        register(UINib(nibName: String(describing: "\(type)"), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: "\(type)"))
        
    }
    
    // Animation
    
    func animateTable() {
        
        reloadData()
        
        let cells = visibleCells
        let tableHeight: CGFloat = bounds.size.height
            
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration:1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .init(), animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
                
            index += 1
        }
    }
}


/**
    Use this collectionview extension and use xib file
 */

public extension UICollectionView {
    
    func getResuableCellOf<T : UICollectionViewCell>(type: T.Type, forIndexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: String(describing: "\(type)"), for: forIndexPath) as? T
    }
    
    func getResuableHeaderOf<T : UIView>(type: T.Type, forIndexPath: IndexPath) -> T? {
        
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: "\(type)"), for: forIndexPath) as? T
    }
    
    func registerCellOf<T: UICollectionViewCell>(type: T.Type) {
        
        register(UINib(nibName: String(describing: "\(type)"), bundle: nil), forCellWithReuseIdentifier: String(describing: "\(type)"))
    }
    
    func registerHeaderOf<T: UICollectionReusableView>(type: T.Type) {
        
        register(UINib(nibName: String(describing: "\(type)"), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: "\(type)"))
    }
}

// Extension for view controller identifier
extension UIViewController {
    
    public static var identifier: String {
        get {
            return "\(self)"
        }
    }
    
    public func hideKeyboard() {
        UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
    }
}

public extension UIView {
    
    var nibName: String {
        get {
            return String(describing: type(of: self))
        }
    }
    
    func getNibFile() -> UIView? {
        
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            self.clipsToBounds = true
            self.layer.borderWidth = newValue
        }
        get {
            return self.borderWidth
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            self.clipsToBounds = true
            self.layer.cornerRadius = newValue
        }
        get {
            return self.cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        set {
            self.clipsToBounds = true
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return self.borderColor
        }
    }
    
    @IBInspectable
    var isRounded: Bool {
        set {
            if newValue {
                self.clipsToBounds = true
                DispatchQueue.main.async {
                    self.layer.cornerRadius = self.layer.frame.size.height / 2
                }
            }
        }
        get {
            return self.isRounded
        }
    }
    
    @IBInspectable
    var applyShadow: Bool {
        set {
            dropShadow(color: .black, opacity: 0.1, offSet: CGSize(width: -1.0, height: -1.0), radius: 1, scale: false)
        }
        get {
            return true
        }
    }
    
    func animate(from: CATransitionSubtype = .fromBottom) {
        
        let transition = CATransition()
        transition.duration = 0.1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        transition.type = CATransitionType.moveIn
        transition.subtype = from
        self.layer.add(transition, forKey: kCATransition)
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        //layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //layer.shouldRasterize = true
        if scale {
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    }
    
    func roundCornersWith(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }

    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.clipsToBounds = true;
        self.layer.mask = mask
    }
    
    func animateBounce(from: CGFloat, to: CGFloat, timeInterval: TimeInterval = 0.3) {
        
        DispatchQueue.main.async {
            
            self.transform = CGAffineTransform(scaleX: from, y: from)
            
            UIView.animate(withDuration: timeInterval, animations: {
                self.transform = CGAffineTransform(scaleX: to, y: to)
                //self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { (_) in
                
                //self.transform = CGAffineTransform(scaleX: to, y: to)
            }
        }
    }
    
}

extension UITextField {
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return action == #selector(UIResponderStandardEditActions.copy(_:)) ||
                action == #selector(UIResponderStandardEditActions.cut(_:)) ||
                action == #selector(UIResponderStandardEditActions.select(_:)) ||
                action == #selector(UIResponderStandardEditActions.selectAll(_:))
    }
    
    public func setInputViewDatePicker(target: Any, selector: Selector, maxDate: Date, mode: UIDatePicker.Mode) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.maximumDate = maxDate
        datePicker.datePickerMode = mode //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}

public extension UIApplication {
    
    static func hideKeyboard() {
        UIApplication.topViewController?.view.endEditing(true)
    }
    
    class var topViewController: UIViewController? {
        get {
            return self.getTopViewController(controller: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)
        }
    }
    
    static var hasTopNotch: Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    private class func getTopViewController(controller: UIViewController?) -> UIViewController? {
        
        /*
        if let slideMenuVC = controller as? ExSlideMenuController {
            return getTopViewController(controller: slideMenuVC.mainViewController)
        }
        else */
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return getTopViewController(controller: selected)
            }
        }
        else if let presented = controller?.presentedViewController {
            return getTopViewController(controller: presented)
        }
        
        else if let presented = controller as? UINavigationController {
            return getTopViewController(controller: presented.visibleViewController)
        }
        return controller
    }
}


public extension UILabel {
    
    @IBInspectable
    var systemMediumFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Medium.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemMediumFontWeight
        }
    }
    
    @IBInspectable
    var systemLightFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Light.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemLightFontWeight
        }
    }
    
    @IBInspectable
    var systemBoldFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Bold.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemBoldFontWeight
        }
    }
    
    @IBInspectable
    var systemSemiBoldFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Semibold.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemSemiBoldFontWeight
        }
    }
    
    @IBInspectable
    var systemRegularFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Regular.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemRegularFontWeight
        }
    }
}

public extension UIButton {
    
    @IBInspectable
    var systemMediumFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.titleLabel?.font = Font.Medium.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemMediumFontWeight
        }
    }
    
    @IBInspectable
    var systemLightFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.titleLabel?.font = Font.Light.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemLightFontWeight
        }
    }
    
    @IBInspectable
    var systemBoldFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.titleLabel?.font = Font.Bold.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemBoldFontWeight
        }
    }
    
    @IBInspectable
    var systemSemiBoldFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.titleLabel?.font = Font.Semibold.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemSemiBoldFontWeight
        }
    }
    
    @IBInspectable
    var systemRegularFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.titleLabel?.font = Font.Regular.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemRegularFontWeight
        }
    }
    
}

public extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

public extension UITextField {
    
    @IBInspectable
    var systemMediumFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Medium.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemMediumFontWeight
        }
    }
    
    @IBInspectable
    var systemLightFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Light.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemLightFontWeight
        }
    }
    
    @IBInspectable
    var systemBoldFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Bold.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemBoldFontWeight
        }
    }
    
    @IBInspectable
    var systemSemiBoldFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Semibold.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemSemiBoldFontWeight
        }
    }
    
    @IBInspectable
    var systemRegularFontWeight: CGFloat {
        set {
            DispatchQueue.main.async {
                self.font = Font.Regular.getFontOf(size: newValue)
            }
        }
        get {
            return self.systemRegularFontWeight
        }
    }
    
    @IBInspectable
    var placeHolderColor: UIColor {
        set {
            DispatchQueue.main.async {
                self.attributedPlaceholder = NSAttributedString(
                    string: self.placeholder ?? "",
                    attributes: [
                        NSAttributedString.Key.foregroundColor: newValue
                    ]
                )
            }
        }
        get {
            return self.placeHolderColor
        }
    }
}

public extension UIViewController {
    
    func showToast(message: String, applySystemTheme: Bool = true) {
        
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else {return}
            let messageLbl = UILabel()
            messageLbl.text = message
            messageLbl.numberOfLines = 0
            messageLbl.textAlignment = .center
            messageLbl.font = Font.Medium.getFontOf(size: 15)
            
            if applySystemTheme {

                if #available(iOS 13.0, *) {
                    messageLbl.textColor = .systemBackground
                    messageLbl.backgroundColor = UIColor.label
                } else {
                    // Fallback on earlier versions
                    messageLbl.textColor = .white
                    messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)
                }
            } else {
                messageLbl.textColor = .white
                messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)
            }
            
            let textSize:CGSize = messageLbl.intrinsicContentSize
            //let labelWidth = min(textSize.width, window.frame.width - 40)
            
            let yAxis: CGFloat = UIApplication.hasTopNotch ? 40 : 20
            
            messageLbl.frame = CGRect(x: 20, y: yAxis /*window.frame.height - 90*/, width: window.frame.width - 40, height: textSize.height + 20)
            messageLbl.center.x = window.center.x
            messageLbl.layer.cornerRadius = 5 //messageLbl.frame.height/2
            messageLbl.layer.masksToBounds = true
            window.addSubview(messageLbl)
            
            //messageLbl.alpha = 0
            messageLbl.alpha = 1
            
            //        UIView.animate(withDuration: 0.3) {
            //            messageLbl.alpha = 1
            //        }
            
            messageLbl.animate()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                
                UIView.animate(withDuration: 0.8, animations: {
                    messageLbl.alpha = 0
                }) { (_) in
                    messageLbl.removeFromSuperview()
                }
            }
        }
    }
}

public extension UINavigationController {
    
    func open(vc: UIViewController) {
        let settingsVC = vc
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        self.view.layer.add(transition, forKey: kCATransition)
        self.pushViewController(settingsVC, animated: false)
    }
    
    func close() {
        let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.layer.add(transition, forKey: kCATransition)
        let _ = self.popViewController(animated: false)
    }

}

public extension Bundle {
    
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

public extension Date {
    
    func getTodayTomorrowString() -> String? {
        
        let calendar = Calendar.current
                
        if calendar.isDateInToday(self) {
            // today
            return "Today"
        }
        if calendar.isDateInTomorrow(self) {
            // tomorrow
            return "Tomorrow"
        }
        
        return nil
        
    }
}
