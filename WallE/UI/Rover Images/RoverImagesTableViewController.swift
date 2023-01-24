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
    var tld: TLD?
    var dateFormatter = DateFormatter.string()
    
    let defaultDate = Date()
    var setDate: String?
    
    //    private var setDate: String {
    //        let setDate = dateFormatter.string(from: defaultDate)
    //        return setDate
    //    }
    
    
    private var filteredRovers: [MarsRovers] {
        let defaultDateString = dateFormatter.string(from: defaultDate)
        let dateValue = setDate ?? defaultDateString
        let selectedIndex = self.roverSegmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            viewModel.loadData(from: .spirit(dateValue))
            return tld?.photos.filter { $0.rover.name == "spirit" } ?? []
        case 1:
            viewModel.loadData(from: .curiosity(dateValue))
            return tld?.photos.filter { $0.rover.name == "curiosity" } ?? []
        case 2:
            viewModel.loadData(from: .opportunity(dateValue))
            return tld?.photos.filter { $0.rover.name == "opportunity" } ?? []
        default:
            return []
        }
        
    }
    
    
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
        let setDate = dateFormatter.string(from: selectedDate)
        print(setDate)
    }
    
    @IBAction func roverSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
        
//        let defaultDateString = dateFormatter.string(from: defaultDate)
//        let dateValue = setDate ?? defaultDateString
//        switch sender.selectedSegmentIndex {
//        case 0:
//            viewModel.loadData(from: .spirit(dateValue))
//
//            break
//        case 1:
//            viewModel.loadData(from: .curiosity(dateValue))
//
//            break
//        case 2:
//            viewModel.loadData(from: .opportunity(dateValue))
//            break
//
//        default:
//            break
//        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRovers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "roverImageCell", for: indexPath) as? RoverImageTableViewCell else { return UITableViewCell()}
        let cellData = filteredRovers[indexPath.row]
//        cell.configureCell(with: cellData)
        cell.textLabel?.text = "\(cellData.rover.name)"
        cell.detailTextLabel?.text = "\(cellData.camera.fullName)"
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
        tableView.reloadData()
    }
}
