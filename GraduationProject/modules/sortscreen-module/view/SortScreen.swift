//
//  SortScreen.swift
//  GraduationProject
//
//  Created by Berkay Tuncel on 22.02.2023.
//

import UIKit

protocol SortScreenDelegate: AnyObject {
    func sortScreenResponse(sortType: SortType)
}

class SortScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: SortScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSheetPresentationController()
        configureTableView()
    }
}

extension SortScreen: UISheetPresentationControllerDelegate {
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
}

extension SortScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SortType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SortCell.reuseID, for: indexPath) as? SortCell else { return UITableViewCell() }
        
        cell.setCell(sortType: SortType.allCases[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sortType = SortType.allCases[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.sortScreenResponse(sortType: sortType)
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

extension SortScreen {
    func configureSheetPresentationController() {
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.medium()]
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
