import UIKit

class CircleView: UIView {
    var radius: CGFloat = 100
    
    var area: CGFloat {
        return pow(radius, 2) * CGFloat.pi
    }
    
    var absorbDistance: CGFloat {
        return radius / 2
    }
    
    func absorb(otherCircle: CircleView) {
        let commonArea = otherCircle.area + area
        let newRadius = (commonArea/CGFloat.pi).squareRoot()
        radius = newRadius
        setSize(with: radius)
        setBackroundColor(with: .blue)
    }
    
    func canAbsorb(_ otherCircle: CircleView) -> Bool {
        let deltaX = otherCircle.center.x - self.center.x
        let deltaY = otherCircle.center.y - self.center.y
        let distanceBetweenCenters = (pow(deltaX, 2) + pow(deltaY, 2)).squareRoot()
        
        return distanceBetweenCenters <= absorbDistance
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
