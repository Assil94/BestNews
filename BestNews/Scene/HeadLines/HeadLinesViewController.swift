//
//  ViewController.swift
//  BestNews
//
//  Created by Assil Heddar on 20/09/2022.
//

import UIKit

class HeadLinesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    private let headLinesViewModel = HeadLinesViewModel()
    private let headLinesView = UITableView()
    
    private let myrefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLayoutSubviews() {
        headLinesView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHeadlines()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setObserver()
        view.addSubview(headLinesView)
        headLinesView.register(HeadLineTableViewCell.nib(), forCellReuseIdentifier: HeadLineTableViewCell.identifier)
        headLinesView.delegate = self
        headLinesView.dataSource = self
        headLinesView.refreshControl = myrefreshControl
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headLinesViewModel.array.getValue()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = headLinesViewModel.array.getValue()![indexPath.row]
        let cell = headLinesView.dequeueReusableCell(withIdentifier: HeadLineTableViewCell.identifier,
                                                     for: indexPath) as! HeadLineTableViewCell
        cell.bind(newValue: item)
        return cell
    }
}

extension HeadLinesViewController {
    private func getHeadlines() {
        headLinesViewModel.getHeadlines(country: "fr")
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        getHeadlines()
        self.headLinesView.reloadData()
    }
    
    private func setObserver() {
        headLinesViewModel.dataLoading.addObserver(observer: Observer { value in
            if value == true {
                self.showSpinnerView()
            } else {
                self.headLinesView.reloadData()
                self.hideSpinnerView()
            }
        })
    }
    
    private func showSpinnerView() {
        myrefreshControl.beginRefreshing()
    }

   private func hideSpinnerView() {
        myrefreshControl.endRefreshing()
    }
}

