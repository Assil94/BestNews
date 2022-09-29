//
//  ViewController.swift
//  BestNews
//
//  Created by Assil Heddar on 20/09/2022.
//

import UIKit

class HeadLinesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var headLinesViewModel: HeadLinesViewModel!
    
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
        view.addSubview(headLinesView)
        headLinesView.register(HeadLineTableViewCell.nib(), forCellReuseIdentifier: HeadLineTableViewCell.identifier)
        headLinesView.delegate = self
        headLinesView.dataSource = self
        headLinesView.refreshControl = myrefreshControl
        setObserver()
        showError()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headLinesViewModel.arrayOfArticles.getValue()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = headLinesViewModel.arrayOfArticles.getValue()![indexPath.row]
        let cell = headLinesView.dequeueReusableCell(withIdentifier: HeadLineTableViewCell.identifier,
                                                     for: indexPath) as! HeadLineTableViewCell
        cell.bind(newValue: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "CompleteNews", sender: self)
    }
    // Change controller and pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "CompleteNews") {
            let indexPath = headLinesView.indexPathForSelectedRow
            let newsDetail = segue.destination as? CompleteNewsViewController
            let selectedNews = headLinesViewModel.arrayOfArticles.getValue()![indexPath!.row]
            newsDetail!.article = selectedNews
            headLinesView.deselectRow(at: indexPath!, animated: true)
        }
    }
}

private extension HeadLinesViewController {
    private func getHeadlines() {
        headLinesViewModel.getHeadlines(country: "fr")
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        getHeadlines()
        self.headLinesView.reloadData()
    }
    // This method is used to observe "dataLoading" a boolean used to observe the state of the call, if true we show the spinner from refresh control
    // and if false, we refresh tableview data and hide the spinner
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
    
    private func showError() {
        headLinesViewModel.errorHandler = { [weak self] titleText, messageText in
            DispatchQueue.main.async {
                self?.showAlert(title: titleText, message: messageText)
            }
        }
    }
}
