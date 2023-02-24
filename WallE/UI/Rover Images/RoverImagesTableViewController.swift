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
    var dateFormatter = DateFormatter.string()
    
    //    var setDate: String?
    let defaultDate = Date()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = RoverImagesViewModel(delegate: self)
        // Date Picker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        // Segmented Control
        roverSegmentedControl.addTarget(self, action: #selector(roverSegmentedControlValueChanged(_:)), for: .valueChanged)
        // Initial loaded table view
        filterData()
    }
    
    // MARK: - Methods
    func filterData() {
        let selectedDate = datePicker.date
        let dateValue = dateFormatter.string(from: selectedDate)
        
        switch roverSegmentedControl.selectedSegmentIndex {
        case 0:
            viewModel.loadData(endpoint: .curiosity(dateValue))
            break
        case 1:
            viewModel.loadData(endpoint: .opportunity(dateValue))
            break
        case 2:
            viewModel.loadData(endpoint: .spirit(dateValue))
            break
        default:
            break
        }
        tableView.reloadData()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        filterData()
    }
    
    @IBAction func roverSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        filterData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.roversArray.isEmpty {
            return 1
        } else {
            return viewModel.roversArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if viewModel.roversArray.isEmpty {
            cell = tableView.dequeueReusableCell(withIdentifier: "noImagesCell", for: indexPath)
            cell.textLabel?.text = "This rover took no images on this date."
        } else {
            guard let roverCell = tableView.dequeueReusableCell(withIdentifier: "roverImageCell", for: indexPath) as? RoverImageTableViewCell else { return UITableViewCell()}
            let cellData = viewModel.roversArray[indexPath.row]
            
            roverCell.configureCell(with: cellData)
            cell = roverCell
        }
        return cell
    }
    
} // End of Class

extension RoverImagesTableViewController: RoverImagesViewModelDelegate {
    func updateViews() {
        tableView.reloadData()
    }
}
