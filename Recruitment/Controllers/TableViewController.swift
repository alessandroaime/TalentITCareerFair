import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return companies.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?.first as! CellViewController
        cell.nameLabel.text = companies[indexPath.row].name
        cell.setStatusIndicator(indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 45 }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let positive: UIAlertAction = UIAlertAction(title: "Positive", style: .default) { action in
            companies[indexPath.row].status = "positive"
            self.tableView.reloadData()
        }
        let neutral: UIAlertAction = UIAlertAction(title: "Neutral", style: .default) { action in
            companies[indexPath.row].status = "neutral"
            self.tableView.reloadData()
        }
        let negative: UIAlertAction = UIAlertAction(title: "Negative", style: .default) { action in
            companies[indexPath.row].status = "negative"
            self.tableView.reloadData()
        }
        let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        actionSheet.addAction(positive)
        actionSheet.addAction(neutral)
        actionSheet.addAction(negative)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
