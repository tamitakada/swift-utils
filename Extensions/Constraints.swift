import UIKit


extension UIView {
    
    // MARK: Positioning Constraints
    
    func centerView(x: Bool, y: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if x {
            if let centerX = superview?.centerXAnchor {
                self.centerXAnchor.constraint(equalTo: centerX).isActive = true
            }
        }
        
        if y {
            if let centerY = superview?.centerYAnchor {
                self.centerYAnchor.constraint(equalTo: centerY).isActive = true
            }
        }
    }
    
    func constrain(
        top: NSLayoutYAxisAnchor?, constantTop: CGFloat?,
        bottom: NSLayoutYAxisAnchor?, constantBottom: CGFloat?,
        trailing: NSLayoutXAxisAnchor?, constantTrailing: CGFloat?,
        leading: NSLayoutXAxisAnchor?, constantLeading: CGFloat?) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: constantTop ?? 0).isActive = true
        }

        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: constantBottom ?? 0).isActive = true
        }

        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: constantTrailing ?? 0).isActive = true
        }

        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: constantLeading ?? 0).isActive = true
        }
    }
    
    func setRectangularPadding(horizontal: CGFloat?, vertical: CGFloat?) {
        if let side = horizontal {
            constrain(
                top: nil, constantTop: 0,
                bottom: nil, constantBottom: 0,
                trailing: superview?.trailingAnchor, constantTrailing: -side,
                leading: superview?.leadingAnchor, constantLeading: side
            )
        }
        
        if let top = vertical {
            constrain(
                top: superview?.topAnchor, constantTop: top,
                bottom: superview?.bottomAnchor, constantBottom: -top,
                trailing: nil, constantTrailing: 0,
                leading: nil, constantLeading: 0
            )
        }
    }
    
    func fillView() {
        setRectangularPadding(horizontal: 0, vertical: 0)
    }
    
    // MARK: Size Constraints
    
    func setSize(width: CGFloat?, height: CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    enum SizeType {
        case width
        case height
        case both
    }
    
    func setSize(view: UIView, multiplier: CGFloat, type: SizeType) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .width:
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        case .height:
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
        case .both:
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
        }
    }
    
    func setSize(view: UIView, multiplier: CGFloat, type: SizeType, priority: UILayoutPriority) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        var secondConstraint: NSLayoutConstraint?
        
        switch type {
        case .width:
            constraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        case .height:
            constraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        case .both:
            constraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
            secondConstraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        
        secondConstraint?.priority = priority
        secondConstraint?.isActive = true
    }
    
    func constrainSize(width: CGFloat?, height: CGFloat?, lessThan: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            if lessThan {
                self.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
            } else {
                self.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
            }
        }
        
        if let height = height {
            if lessThan {
                self.heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
            } else {
                self.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
            }
        }
    }

}
