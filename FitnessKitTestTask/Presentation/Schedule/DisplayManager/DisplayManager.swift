//
//  DisplayManager.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import UIKit

class DisplayManager: NSObject {
    private unowned var tableView: UITableView
    private var activiteis: [[Activity]] = []
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupInitalState()
    }
    
    private func setupInitalState() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .white
        tableView.allowsSelection = false
        tableView.backgroundColor = .white
    }
    
    func reloadTableView(with activities: [[Activity]]) {
        self.activiteis = activities
        tableView.reloadData()
    }
}

extension DisplayManager: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return activiteis.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activiteis[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActivityCell
        let activity = activiteis[indexPath.section][indexPath.row]
        cell.fillCell(with: activity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return activiteis[section].first?.date
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        let text = activiteis[section][0].date
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .lightGray
        view.backgroundColor = .white
        return view
    }
}
