//
//  LandMarkListViewController.swift
//  LandMarks
//
//  Created by Mostafa Shamin on 21/6/24.
//

import UIKit

class LandmarkListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: LandmarkListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitle.text = "LandMarks"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LandMarkTableViewCell", bundle: nil), forCellReuseIdentifier: "LandMarkCell")
        
        viewModel = LandmarkListViewModel()
        if let customURL = Bundle.main.url(forResource: "landmarkData", withExtension: "json") {
            viewModel.setURL(customURL)
        }
        viewModel.loadLandmarks { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension LandmarkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfLandmarks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandMarkCell", for: indexPath) as? LandMarkTableViewCell else {
            fatalError("Unable to dequeue LandmarkTableViewCell")
        }
        
        let landmark = viewModel.landmark(at: indexPath.row)
        cell.configure(with: landmark)
        
        return cell
    }
}
