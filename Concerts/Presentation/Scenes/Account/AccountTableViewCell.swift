//
//  AccountTableViewCell.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 29.06.2023.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    static let reuseId = "cellAccount"

    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = .white
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = bounds
    }
    
    func configure(placeholder: String) {
        textField.placeholder = placeholder
    }
    

}

extension AccountTableViewCell {
    private func makeLayout() {
        contentView.addSubview(textField)
    }
//    @objc
//    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
//        let selectedSegmentIndex = sender.selectedSegmentIndex
//
//            if selectedSegmentIndex == 0 {
//                // Установка светлой темы
//                segmentedControl.selectedSegmentTintColor = UIColor.lightGray
//                segmentedControl.backgroundColor = UIColor.white
//                segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
//                segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
//            } else {
//                // Установка темной темы
//                segmentedControl.selectedSegmentTintColor = UIColor.darkGray
//                segmentedControl.backgroundColor = UIColor.black
//                segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//                segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
//            }
//    }
}
