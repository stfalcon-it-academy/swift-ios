
import UIKit


class ViewController: UIViewController {
    // MARK: - Actions
    @IBAction func handlerButtonTap(sender: UIButton) {
        let buttonView = sender
        let buttonRect = buttonView.superview!.convertRect(buttonView.frame, toCoordinateSpace: UIScreen.mainScreen().fixedCoordinateSpace)
        
        print("1. \(buttonRect)")
        print("2. \(buttonView.frame)")
       
        do {
            let rect = buttonView.superview!.convertRect(buttonView.frame, toCoordinateSpace: UIScreen.mainScreen().coordinateSpace)
            
            print("3. \(rect)")
            print("4. \(buttonView.frame)\n")
        }
    }
}


// MARK: - UICoordinateSpace
extension UICoordinateSpace {
    static func convertRect(rect: CGRect, fromCoordinateSpace fromSpace:UICoordinateSpace, toCoordinateSpace toSpace:UICoordinateSpace) -> CGRect {
        return fromSpace.convertRect(rect, toCoordinateSpace: toSpace)
    }
}
