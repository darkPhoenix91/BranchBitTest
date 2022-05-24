//
//  UserList.swift
//  BranchBitTest
//
//  Created by Miguel Alejandro Arellano Mercado on 23/05/22.
//

import UIKit

class UserList: UIViewController {

    var OptionSelected = ""
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80.0
        tableView.register(CustomCell.self, forCellReuseIdentifier: "\(CustomCell.self)")
        tableView.register(HeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: "\(HeaderSectionCell.self)")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        tableView.reloadData()
        initObserver()
    }
    
    func initObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_ :)), name: Notification.Name("optionSelected"), object: nil)
    }

    @objc func didGetNotification (_ notification: Notification) {
        let text = notification.object as! String?
        OptionSelected = text!
        print("Tu eleccion final es: \(OptionSelected) $$$$$$$$$$$")
    }
    
    private func configureView() {
        view.addSubview(tableView)
        view.addSubview(continueBtn)
        var topPadding: CGFloat = 0.0
        if let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top {
            topPadding = topInset
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            tableView.bottomAnchor.constraint(equalTo: continueBtn.bottomAnchor),
            
            continueBtn.heightAnchor.constraint(equalToConstant: 50),
            continueBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            continueBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let secondViewController:ResultSelectionViewController = ResultSelectionViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
        print("Button tapped")
    }
}

extension UserList: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserModel.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as?  CustomCell else {
            return UITableViewCell()
        }
        let user = UserModel.getList()[indexPath.row]
        cell.setData(user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(HeaderSectionCell.self)") as? HeaderSectionCell else {
            return UITableViewHeaderFooterView()
        }
        headerCell.setData(title: "Lista de opciones")
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let user = UserModel.getList()[indexPath.row]
        print(user)
        NotificationCenter.default.post(name: Notification.Name("optionSelected"), object: OptionSelected)
    }
}



