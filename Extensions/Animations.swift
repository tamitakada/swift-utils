import UIKit


extension UIView {

    func scale(scaleFactor: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }, completion: { _ in
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
    
    func spin(angle: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(rotationAngle: angle)
        }, completion: { _ in
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            })
        })
    }

}
