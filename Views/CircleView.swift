import UIKit


/*
    The known size is the dimension that will have a clearly defined value (e.g. if you constrain the width to be size 50, then the width is the known size). If you know both width and height, use whichever for the argument.
*/

class CircleView: UIView {
    
    enum KnownSizeType {
        case width
        case height
    }
    
    private let knownSize: KnownSizeType
    
    init(knownSize: KnownSizeType, frame: CGRect) {
        self.knownSize = knownSize
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch knownSize {
        case .width:
            layer.cornerRadius = self.bounds.size.width / 2
        case .height:
            layer.cornerRadius = self.bounds.size.height / 2
        }

        layer.masksToBounds = true
    }
}

