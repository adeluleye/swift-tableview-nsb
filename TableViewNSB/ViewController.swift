//
//  ViewController.swift
//  TableViewNSB
//
//  Created by ADELU ABIDEEN ADELEYE on 10/6/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    let bandCellId = "bandCellId"
    
    let bandsArray = [CellDataInfo(image: "metallica", title: "Metallica"),
                      CellDataInfo(image: "slipknot", title: "Slipknot"),
                      CellDataInfo(image: "nirvana", title: "Nirvana"),
                      CellDataInfo(image: "acdc", title: "AC/DC"),
                      CellDataInfo(image: "system", title: "System of down")]
    
    let songsArray = [CellDataInfo(image: "1", title: "The Unforgiven"),
                      CellDataInfo(image: "2", title: "Snuff"),
                      CellDataInfo(image: "3", title: "Smells Like Teen Spirit"),
                      CellDataInfo(image: "4", title: "Back In Black"),
                      CellDataInfo(image: "5", title: "Chop Suey")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "TableViewNSB"
        navigationController?.navigationBar.barTintColor = UIColor(r: 0, g: 255, b: 198)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BandCell.self, forCellReuseIdentifier: bandCellId)
        view.addSubview(tableView)
        tableView.setAnchor(top: view.topAnchor, topPad: 0, bottom: view.bottomAnchor, bottomPad: 0, left: view.leftAnchor, leftPad: 0, right: view.rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return songsArray.count
        }
        return bandsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! BandCell
        cell.pictureImageView.image = UIImage(named: bandsArray[indexPath.item].image!)
        cell.titleLabel.text = bandsArray[indexPath.item].title
        
        if indexPath.section == 1 {
            cell.pictureImageView.image = UIImage(named: songsArray[indexPath.item].image!)
            cell.titleLabel.text = songsArray[indexPath.item].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "First Section"
        }
        return "Second Section"
    }
}

class BandCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let image = UIImage(named: "")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Name"
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)
        
        cellView.setAnchor(top: topAnchor, topPad: 4, bottom: bottomAnchor, bottomPad: 4, left: leftAnchor, leftPad: 8, right: rightAnchor, rightPad: 8, height: 0, width: 0)
        pictureImageView.setAnchor(top: nil, topPad: 0, bottom: nil, bottomPad: 0, left: cellView.leftAnchor, leftPad: 8, right: nil, rightPad: 0, height: 40, width: 40)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.setAnchor(top: nil, topPad: 0, bottom: nil, bottomPad: 0, left: pictureImageView.rightAnchor, leftPad: 20, right: rightAnchor, rightPad: 20, height: 40, width: 0)
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
