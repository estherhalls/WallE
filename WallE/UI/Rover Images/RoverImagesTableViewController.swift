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
    
    // MARK: - Properties
    private var viewModel: RoverImagesViewModel!
    var dataArray: [MarsRovers] = []
    var setDate: String?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = RoverImagesViewModel(delegate: self)
        // Date Picker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        // Segmented Control
        roverSegmentedControl.addTarget(self, action: #selector(roverSegmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    
    // MARK: - Methods
    /// I need dateValue to escape this function to be assigned to the earthDate value used in the segmented view
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let setDate = dateFormatter.string(from: selectedDate)
        print(setDate)
    }
    
    @IBAction func roverSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        if let dateValue = setDate {
        switch sender.selectedSegmentIndex {
            case 0:
            viewModel.loadData(from: .spirit(dateValue))
            case 1:
            viewModel.loadData(from: .curiosity(dateValue))
            case 2:
            viewModel.loadData(from: .opportunity(dateValue))
            default: break
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.roversArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "roverImageCell", for: indexPath) as? RoverImageTableViewCell else { return UITableViewCell()}
        let roverData = viewModel.roversArray[indexPath.row]
        cell.configureCell(with: roverData)
        
        return cell
    }

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }

    
} // End of Class

extension RoverImagesTableViewController: RoverImagesViewModelDelegate {
    func updateViews() {
        self.tableView.reloadData()
    }
}
