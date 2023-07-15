import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var presentButton: UIButton!

    @IBAction private func presentButtonPressed(_ sender: Any) {
        guard let popoverViewController = UIStoryboard(name: "PopoverViewController", bundle: nil).instantiateInitialViewController() else { return }
        
        popoverViewController.preferredContentSize = PopoverViewController.SegmentedState.first.contentHeight
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.presentationController?.delegate = self
        popoverViewController.popoverPresentationController?.sourceView = presentButton
        popoverViewController.popoverPresentationController?.sourceRect = presentButton.bounds
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        
        present(popoverViewController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
