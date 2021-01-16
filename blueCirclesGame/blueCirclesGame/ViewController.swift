import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func orangePanAction(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
    }
    
    @IBAction private func greenPanAction(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
    }
    
    
    @IBAction private func bluePanAction(_ gesture: UIPanGestureRecognizer) {
        moveView(for: gesture)
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
