import UIKit

struct companyCell {
    let name: String!
    let status: String!
}

class TableViewController: UITableViewController {
    
    var companies = [Company]()
    
    override func viewDidLoad() {
        companies = [Company(name: "Codemate", status: .positive),
                     Company(name: "Metropolia University", status: .neutral),
                     Company(name: "Nokia", status: .negative)]
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?.first as! CellViewController
        cell.companyName.text = companies[indexPath.row].name
        //cell.companyStatus.text = companies[indexPath.row].status
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}



