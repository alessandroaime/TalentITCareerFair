import UIKit

class CellViewController: UITableViewCell {
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyStatus: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touchCount = touches.count
        //let touch = touches.first!
        let tapCount = touches.first!.tapCount
        switch tapCount {
        case 1:
            //Company.status = positive
            companyStatus.textColor = UIColor.green
        case 2:
            //Company.status = neutral
            companyStatus.textColor = UIColor.yellow
        case 3:
            //Company.status = negative
            companyStatus.textColor = UIColor.red
        default:
            //Company.status = unrated
            companyStatus.textColor = UIColor.white
        }
    }
    
}
