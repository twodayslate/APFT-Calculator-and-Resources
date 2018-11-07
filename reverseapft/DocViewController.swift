//
//  ViewController.swift
//  acft
//
//  Created by Zachary Gorak on 10/15/18.
//  Copyright © 2018 Zachary Gorak. All rights reserved.
//

import UIKit
import PDFKit

class DocNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [DocTableViewController()]
    }
}

class DocTableViewCell: UITableViewCell {
    let subtitleCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    let value1Cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    
    init() {
        super.init(style: .default, reuseIdentifier: "doc")
        
        self.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        
        let stack = UIStackView()
        stack.spacing = 10.0
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        self.contentView.addSubview(stack)
        
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": stack]))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": stack]))
        
        let leftStack = UIStackView()
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        leftStack.spacing = 10.0 // you don't want this if there is no subtitle
        leftStack.axis = .vertical
        leftStack.distribution = .fill
        stack.addArrangedSubview(leftStack)
        
        self.title.font = self.subtitleCell.textLabel?.font
        self.title.textColor = self.subtitleCell.textLabel?.textColor
        self.title.tintColor = self.subtitleCell.textLabel?.tintColor
        leftStack.addArrangedSubview(self.title)
        
        self.subtitle.font = self.subtitleCell.detailTextLabel?.font
        self.subtitle.textColor = self.subtitleCell.detailTextLabel?.textColor
        self.subtitle.tintColor = self.subtitleCell.detailTextLabel?.tintColor
        leftStack.addArrangedSubview(self.subtitle)
        
        self.date.font = self.value1Cell.detailTextLabel?.font
        self.date.textColor = self.value1Cell.detailTextLabel?.textColor
        self.date.tintColor = self.value1Cell.detailTextLabel?.tintColor
        self.date.textAlignment = .right
        stack.addArrangedSubview(self.date)
    }
    
    let date = UILabel()
    let title = UILabel()
    let subtitle = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DocTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Documents"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: do this automagically
        //https://stackoverflow.com/questions/36378001/is-it-possible-to-count-pictures-in-asset-catalog-with-particular-prefix
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DocTableViewCell()
        
        if indexPath.row == 0 {
            cell.title.text = "FM 21-20"
            cell.subtitle.text = "Chapter 14"
            cell.date.text = "October 1998"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = "ch14"
        self.navigationController?.pushViewController(DocViewController(name: name), animated: true)
    }
}

class DocViewController: UIViewController {
    
    var name: String?
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
        self.title = "ARMY PHYSICAL FITNESS TEST"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let data = NSDataAsset(name: (self.name)!)
        {
            let doc = PDFDocument(data: data.data)
            let v = PDFView(frame: self.view.frame)
            self.view.addSubview(v)
            v.document = doc
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        } else {
            // show some error
            let warn = UILabel(frame: self.view.frame)
            warn.textAlignment = .center
            warn.text = "File not found!"
            warn.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(warn)
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": warn]))
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": warn]))
        }
        
    }
    
    @objc func share() {
        if let data = NSDataAsset(name: (self.name)!)
        {
            let shareSheet = UIActivityViewController(activityItems: [data.data], applicationActivities: [])
            self.present(shareSheet, animated: true, completion: nil)
        }
        
    }
    
    
}
