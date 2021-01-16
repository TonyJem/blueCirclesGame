import UIKit

class CircleView: UIView {
    var radius: CGFloat = 100
    
    var area: CGFloat {
        return pow(radius, 2) * CGFloat.pi
    }
    
    func absorb(otherCircle: CircleView) {
        let commonArea = otherCircle.area + area
        let newRadius = (commonArea/CGFloat.pi).squareRoot()
        radius = newRadius
        setSize(with: radius)
        setBackroundColor(with: .blue)
    }
    
    func setSize(with radius: CGFloat) {
        self.frame.size.width = radius * 2
        self.frame.size.height = radius * 2
        self.layer.cornerRadius = radius
    }
    
    func setBackroundColor(with color: UIColor) {
        self.backgroundColor = color
    }
}
