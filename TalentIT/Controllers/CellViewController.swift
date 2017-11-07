import UIKit


class CellViewController: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusIndicator: UILabel!
    
    func setStatusColor(status: String) {
        switch status {
        case "positive":
            statusIndicator.textColor = UIColor.green
        case "neutral":
            statusIndicator.textColor = UIColor.yellow
        case "negative":
            statusIndicator.textColor = UIColor.red
        default:
            statusIndicator.textColor = UIColor.gray
        }
    }
    
}
