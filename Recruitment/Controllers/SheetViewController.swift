import UIKit

class SheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    func addGesture() {
        let tap = UITapGestureRecognizer(target: CellViewController(), action: #selector(SheetViewController.showActionSheet))
        view.addGestureRecognizer(tap)
    }
    
    @objc func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let positive: UIAlertAction = UIAlertAction(title: "Positive", style: .default) { action in
            companies![absoluteIndexPath.row].status = "positive"
        }
        let neutral: UIAlertAction = UIAlertAction(title: "Second Action", style: .default) { action in
            companies![absoluteIndexPath.row].status = "neutral"
        }
        let negative: UIAlertAction = UIAlertAction(title: "Second Action", style: .default) { action in
            companies![absoluteIndexPath.row].status = "negative"
        }
        let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        
        actionSheet.addAction(positive)
        actionSheet.addAction(neutral)
        actionSheet.addAction(negative)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
}
