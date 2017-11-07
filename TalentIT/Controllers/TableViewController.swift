import UIKit
import CoreData


class TableViewController: UITableViewController {
    
    var companies = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TalentIT"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Company")
        do {
            companies = (try managedContext?.fetch(fetchRequest))!
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let company = companies[indexPath.row]
        let cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?.first as! CellViewController
        cell.nameLabel.text = company.value(forKeyPath: "name") as? String
        cell.setStatusColor(status: (company.value(forKeyPath: "status") as? String)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let positive: UIAlertAction = UIAlertAction(title: "Positive", style: .default) { action in
            self.update(status: "positive", index: indexPath.row)
            self.tableView.reloadData()
        }
        let neutral: UIAlertAction = UIAlertAction(title: "Neutral", style: .default) { action in
            self.update(status: "neutral", index: indexPath.row)
            self.tableView.reloadData()
        }
        let negative: UIAlertAction = UIAlertAction(title: "Negative", style: .default) { action in
            self.update(status: "negative", index: indexPath.row)
            self.tableView.reloadData()
        }
        let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        actionSheet.addAction(positive)
        actionSheet.addAction(neutral)
        actionSheet.addAction(negative)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func addCompany(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Company", message: "What's the name of the company?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [unowned self] action in
            let textField = alert.textFields?.first
            let companyToSave = textField?.text
            self.add(name: companyToSave!)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
    
    func add(name: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Company", in: managedContext!)
        let company = NSManagedObject(entity: entity!, insertInto: managedContext)
        company.setValue(name, forKeyPath: "name")
        company.setValue("unknown", forKeyPath: "status")
        do {
            try managedContext?.save()
            companies.append(company)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func update(status: String, index: Int) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        do {
            companies = (try managedContext?.fetch(fetchRequest))!
            let company = companies[index]
            company.setValue(status, forKey: "status")
            //managedContext?.delete(company)
            do {
                try managedContext?.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
}
