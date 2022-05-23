//
//  HeaderSectionCell.swift
//  BranchBitTest
//
//  Created by Miguel Alejandro Arellano Mercado on 23/05/22.
//

import UIKit

protocol HeaderSectionCellDelegate:AnyObject {
    func didTapButton()
}

class HeaderSectionCell: UITableViewHeaderFooterView {
    
    weak var delegateOptions: HeaderSectionCellDelegate?
    
    private var  titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var continueBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.contentMode = .scaleAspectFit
        nextBtn.backgroundColor = .blue
        nextBtn.setTitle("Continuar", for: .normal)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        nextBtn.layer.cornerRadius = 5
        nextBtn.layer.masksToBounds = true
        return nextBtn
    }()
    
    private var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(view)
        view.addSubview(titleLabel)
        view.addSubview(continueBtn)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            continueBtn.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueBtn.heightAnchor.constraint(equalToConstant: 40),
            continueBtn.widthAnchor.constraint(equalToConstant: 100),
            continueBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func setData(title: String) {
        titleLabel.text = title
    }
    
    @objc func buttonAction(sender: UIButton!) {
        delegateOptions?.didTapButton()
        print("Button tapped")
    }
}

