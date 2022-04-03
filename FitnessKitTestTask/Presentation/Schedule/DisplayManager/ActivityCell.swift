//
//  ActivityCell.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import UIKit
import SnapKit

private enum CellConstraints: Int {
    case padding = 15
}

class ActivityCell: UITableViewCell {
    private let startTimeLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private let activityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        return label
    }()

    private let coachNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let placeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2
        return label
    }()

    private let colorView: UIView = {
        let view = UIView()
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        let containerView = UIView()
        self.addSubview(containerView)
        containerView.addSubview(colorView)
        containerView.addSubview(startTimeLabel)
        containerView.addSubview(endTimeLabel)
        containerView.addSubview(activityNameLabel)
        containerView.addSubview(coachIcon)
        containerView.addSubview(coachNameLabel)
        containerView.addSubview(placeIcon)
        containerView.addSubview(placeLabel)
        
        let padding = CellConstraints.padding.rawValue
        let aspectRatioTimeLabelWidth = 0.09
        let aspectRatioTextLabels = 0.28
        
        containerView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(2.5)
        }
        
        colorView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(7)
        }
        
        startTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(colorView.snp.right).inset(-padding)
            make.top.equalToSuperview().inset(padding)
            make.width.equalToSuperview().multipliedBy(aspectRatioTimeLabelWidth)
        }

        endTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(colorView.snp.right).inset(-padding)
            make.top.equalTo(startTimeLabel.snp.bottom).inset(-padding).priority(.low)
            make.bottom.equalToSuperview().inset(padding)
            make.width.equalToSuperview().multipliedBy(aspectRatioTimeLabelWidth)
        }

        activityNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startTimeLabel.snp.centerY)
            make.left.equalTo(startTimeLabel.snp.right).inset(-padding)
            make.right.equalToSuperview().inset(5)
        }

        coachIcon.snp.makeConstraints { make in
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.left.equalTo(endTimeLabel.snp.right).inset(-padding).priority(.low)
            make.width.height.equalTo(20)
        }

        coachNameLabel.snp.makeConstraints { make in
            make.left.equalTo(coachIcon.snp.right).inset(-5)
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.width.equalToSuperview().multipliedBy(aspectRatioTextLabels)
        }

        placeIcon.snp.makeConstraints { make in
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.left.equalTo(coachNameLabel.snp.right).inset(-padding)
            make.width.height.equalTo(20)
        }

        placeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(endTimeLabel.snp.centerY)
            make.left.equalTo(placeIcon.snp.right).inset(-5)
            make.width.equalToSuperview().multipliedBy(aspectRatioTextLabels)
        }

        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
    }
    
    func fillCell(with activity: Activity) {
        startTimeLabel.text = activity.startTime
        endTimeLabel.text = activity.endTime
        activityNameLabel.text = activity.className
        coachNameLabel.text = activity.coach?.name
        placeLabel.text = activity.place
        colorView.backgroundColor = UIColor().colorWithHexString(hexString: activity.activityColor, alpha: 1)
    }
}
