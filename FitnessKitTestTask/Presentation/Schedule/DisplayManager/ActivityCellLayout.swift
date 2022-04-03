//
//  ActivityCellLayout.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import UIKit

private enum CellConstraints: Int {
    case padding = 15
}

class ActivityCellLayout {
    private let startTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "15:12"
        return label
    }()
    
    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "15:12"
        return label
    }()
    
    private let activityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "ASDASDASDAS"
        return label
    }()
    
    private let coachNameLabel: UILabel = {
        let label = UILabel()
        label.text = "ASDASDASDAS"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "ASDASDASDAS"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let coachIcon: UIImageView = {
        let uiimageView = UIImageView()
        let image = UIImage(named: "person")
        uiimageView.image = image
        uiimageView.contentMode = .scaleAspectFill
        return uiimageView
    }()
    
    private let placeIcon: UIImageView = {
        let uiimageView = UIImageView()
        let image = UIImage(named: "geotag")
        uiimageView.image = image
        return uiimageView
    }()
    
    private let view: UITableViewCell

    init(cell: UITableViewCell) {
        self.view = cell
    }
    
    private func setupLayout() {
        view.addSubview(colorView)
        view.addSubview(startTimeLabel)
        view.addSubview(endTimeLabel)
        view.addSubview(activityNameLabel)
        view.addSubview(coachIcon)
        view.addSubview(coachNameLabel)
        view.addSubview(placeIcon)
        view.addSubview(placeLabel)
        
        let padding = CellConstraints.padding.rawValue
       
        colorView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(10)
        }
        
        startTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(colorView.snp.right).inset(-padding)
            make.top.equalToSuperview().inset(padding)
        }
        
        activityNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startTimeLabel.snp.centerY)
            make.left.equalTo(startTimeLabel.snp.right).inset(-padding)
            make.right.equalToSuperview().priority(.low)
        }
        
        endTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(colorView.snp.right).inset(-padding)
            make.top.equalTo(startTimeLabel.snp.bottom).inset(-padding)
            make.bottom.equalToSuperview().inset(padding)
        }
        
        coachIcon.snp.makeConstraints { make in
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.left.equalTo(endTimeLabel.snp.right).inset(-padding)
            make.width.height.equalTo(20)
        }
        
        coachNameLabel.snp.makeConstraints { make in
            make.left.equalTo(coachIcon.snp.right).inset(-5)
            make.centerY.equalTo(endTimeLabel.snp.centerY)
        }
        
        placeIcon.snp.makeConstraints { make in
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.left.equalTo(coachNameLabel.snp.right).inset(-padding)
            make.width.height.equalTo(20)
        }
        
        placeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.left.equalTo(placeIcon.snp.right).inset(-5)
            make.right.equalToSuperview().priority(.low)
        }
    }
}

