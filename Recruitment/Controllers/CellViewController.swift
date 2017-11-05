import UIKit

class CellViewController: UITableViewCell {
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyStatus: UILabel!
    
    func setStatusColor() {
        switch companies![absoluteIndexPath.row].status {
        case "positive":
            companyStatus.textColor = UIColor.green
        case "neutral":
            companyStatus.textColor = UIColor.yellow
        case "negative":
            companyStatus.textColor = UIColor.red
        default:
            companyStatus.textColor = UIColor.gray
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch = touches.first!
        let tapCount = touches.first!.tapCount
        switch tapCount {
        case 1:
            companies![absoluteIndexPath.row].status = "positive"   //.positive
        case 2:
            companies![absoluteIndexPath.row].status = "neutral"    //.neutral
        case 3:
            companies![absoluteIndexPath.row].status = "negative"   //.negative
        default:
            companies![absoluteIndexPath.row].status = "unknown"    //.unknown
        }
        self.setStatusColor()
        updateJSON()
    }
}
