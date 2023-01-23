//
//  RoverImagesTableViewController.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import UIKit

class RoverImagesTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var roverSegmentedControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var viewModel: RoverImagesViewModel!
    var roverData = [MarsRovers]()
//    private var roverSegments: [String] = ["spirit", "curiosity", "opportunity"] {
//        if roverSegmentedControl.selectedSegmentIndex == 0 {
//            return
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = RoverImagesViewModel()
        roverSegmentedControl.addTarget(self, action: #selector(roverSegmentedControlValueChanged(_:)), for: .valueChanged)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
// MARK: - Methods
    @objc func roverSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.fetchData(for: Endpoint.spirit(<#T##String#>))
        case 1:
            viewModel.fetchData(for: Endpoint.curiosity(<#T##String#>))
        case 2:
            viewModel.fetchData(for: Endpoint.opportunity(<#T##String#>))
        default: break
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return roverData.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
