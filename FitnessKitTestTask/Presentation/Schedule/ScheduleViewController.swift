//
//  ViewController.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import UIKit
import SnapKit

class ScheduleViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .grouped)
        return tableView
    }()
    
    private let scheduleLabel: UILabel = {
       let label = UILabel()
        label.text = "Расписание"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.backgroundColor = .lightGray.withAlphaComponent(0.15)
        label.textAlignment = .center
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()
    
    private var displayManager: DisplayManager!
    private var output: ScheduleViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        output = SchedulePresenter(view: self)
        output?.viewIsReady()
    }
    
    func setupInitialState() {
        setupLayout()
        displayManager = DisplayManager(tableView: tableView)
    }
    
    private func setupLayout() {
        view.addSubview(scheduleLabel)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        let aspectRatio = 0.07
        
        scheduleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(aspectRatio)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(scheduleLabel.snp.bottom).inset(-15)
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
}

extension ScheduleViewController: ScheduleViewInput {
    func activityIndicatorStart() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    func activityIndicatorStop() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
    
    func reloadTableView(with activities: [[Activity]]) {
        displayManager.reloadTableView(with: activities)
    }
    
    private func showAlert(titel: String?, massage: String?) {
        let alert = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: titel, style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func show(error: Error) {
        showAlert(titel: "Ok", massage: error.localizedDescription)
    }
}
