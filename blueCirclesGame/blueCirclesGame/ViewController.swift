import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var circle1: UIView!
    @IBOutlet private weak var circle2: UIView!
    @IBOutlet private weak var circle3: UIView!
    @IBOutlet private weak var circle4: UIView!
    @IBOutlet private weak var circle5: UIView!
    @IBOutlet private weak var circle6: UIView!
    @IBOutlet var circles: [UIView]!
    
    var activeCircles = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeCircles = circles
        roundCorners(for: activeCircles)
    }
    
    @IBAction private func pan1Action(_ gesture: UIPanGestureRecognizer) {
        move(circle1, with: gesture)
    }
    
    @IBAction private func pan2Action(_ gesture: UIPanGestureRecognizer) {
        move(circle2, with: gesture)
    }
    
    @IBAction private func pan3Action(_ gesture: UIPanGestureRecognizer) {
        move(circle3, with: gesture)
    }
    
    @IBAction private func pan4Action(_ gesture: UIPanGestureRecognizer) {
        move(circle4, with: gesture)
    }
    
    @IBAction private func pan5Action(_ gesture: UIPanGestureRecognizer) {
        move(circle5, with: gesture)
    }
    
    @IBAction private func pan6Action(_ gesture: UIPanGestureRecognizer) {
        move(circle6, with: gesture)
    }
    
    private func roundCorners(for circles: [UIView]) {
        for circle in circles {
            circle.layer.cornerRadius = circle.frame.size.width / 2
        }
    }
    
    private func move(_ justMovedView: UIView, with gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        hideIfNeeded(movedView: justMovedView)
    }
    
    private func hideIfNeeded(movedView: UIView) {
        for circle in activeCircles {
            if circle == movedView {
                continue
            }
            let deltaX = circle.center.x - movedView.center.x
            let deltaY = circle.center.y - movedView.center.y
            let distanceBetweenCenters = (pow(deltaX, 2) + pow(deltaY, 2)).squareRoot()
            
            if distanceBetweenCenters < circle.frame.size.width / 4 {
                movedView.isHidden = true
                removeFromCircles(view: movedView)
            }
        }
    }
    
    private func removeFromCircles(view: UIView) {
        for (index, circle) in activeCircles.enumerated() {
            if circle == view {
                activeCircles.remove(at: index)
                break
            }
        }
    }
    
}
