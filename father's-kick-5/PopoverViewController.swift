import UIKit

class PopoverViewController: UIViewController {
    @IBOutlet private weak var segmentedControll: UISegmentedControl!
    @IBOutlet private weak var closeButton: UIButton!
    
    private var segmentedState: SegmentedState = .first
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    @IBAction private func segmentedControllValueChanged(_ sender: UISegmentedControl) {
        guard let state = SegmentedState(rawValue: sender.selectedSegmentIndex) else { return }
        
        segmentedState = state
        
        UIView.animate(withDuration: 0.3) {
            self.preferredContentSize = self.segmentedState.contentHeight
        }
    }
    
    @IBAction private func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        segmentedControll.selectedSegmentIndex = segmentedState.rawValue
    }
}

extension PopoverViewController {
    enum SegmentedState: Int {
        case first
        case second
        
        var contentHeight: CGSize {
            switch self {
            case .first:
                return CGSize(width: 300, height: 280)
            case .second:
                return CGSize(width: 300, height: 150)
            }
        }
    }
}
