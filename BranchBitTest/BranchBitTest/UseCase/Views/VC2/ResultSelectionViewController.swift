//
//  ResultSelectionViewController.swift
//  BranchBitTest
//
//  Created by Miguel Alejandro Arellano Mercado on 23/05/22.
//

import UIKit

class ResultSelectionViewController: UIViewController {

    
    private var dissmisBtn: UIButton = {
        let dissmisBtn = UIButton(type: .custom)
        dissmisBtn.contentMode = .scaleAspectFit
        dissmisBtn.backgroundColor = .blue
        dissmisBtn.setTitle("Terminar", for: .normal)
        dissmisBtn.translatesAutoresizingMaskIntoConstraints = false
        dissmisBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        dissmisBtn.layer.cornerRadius = 5
        dissmisBtn.layer.masksToBounds = true
        return dissmisBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
    }
    
    private func configureView() {
        view.addSubview(dissmisBtn)
        
        NSLayoutConstraint.activate([
            dissmisBtn.heightAnchor.constraint(equalToConstant: 50),
            dissmisBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dissmisBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dissmisBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
}
