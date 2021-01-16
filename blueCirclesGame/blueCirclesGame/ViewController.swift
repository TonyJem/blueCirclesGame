import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func pan1Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("1 moved")
    }
    
    @IBAction private func pan2Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("2 moved")
    }
    
    
    @IBAction private func pan3Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("3 moved")
    }
    
    @IBAction private func pan4Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("4 moved")
    }
    
    @IBAction func pan5Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("5 moved")
    }
    
    @IBAction func pan6Action(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
        print("6 moved")
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
