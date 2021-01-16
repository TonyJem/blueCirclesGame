import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var circle1: UIView!
    @IBOutlet private weak var circle2: UIView!
    @IBOutlet private weak var circle3: UIView!
    @IBOutlet private weak var circle4: UIView!
    @IBOutlet private weak var circle5: UIView!
    @IBOutlet private weak var circle6: UIView!
    @IBOutlet var circles: [UIView]!
    
    var currentChild = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for circle in circles {
            circle.layer.cornerRadius = circle.frame.size.width / 2
        }
    }
    
    @IBAction private func pan1Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("1 moved")
        currentChild = circle1
    }
    
    @IBAction private func pan2Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("2 moved")
        currentChild = circle2
    }
    
    @IBAction private func pan3Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("3 moved")
        currentChild = circle3
    }
    
    @IBAction private func pan4Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("4 moved")
        currentChild = circle4
    }
    
    @IBAction func pan5Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("5 moved")
        currentChild = circle5
    }
    
    @IBAction func pan6Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("6 moved")
        currentChild = circle6
    }
    
    private func moveView(for gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
    }
}
