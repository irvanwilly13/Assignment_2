//
//  URLSessionViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 14/10/24.
//

import UIKit
import SkeletonView
import RxSwift




class URLSessionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolBarView: ToolBarView!
    
    let viewModel = URLSessionViewModel()
    let disposeBag = DisposeBag()
    
    var categoryItems: [PlaceholderUser] = [] {
        didSet {
            self.tableView.reloadData()
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindingDataByRx()
        
    }
    func bindingDataByRx() {
        viewModel.loadingState.asObservable().subscribe(onNext: { [weak self] loading in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch loading {
                case .loading:
                    print("loading")
                    self.tableView.showAnimatedGradientSkeleton()
                case .failed:
                    print("failed")
                    self.tableView.hideSkeleton()
                case .finished:
                    self.tableView.hideSkeleton()
                    print("finished")
                default:
                    break
                }
            }
        }).disposed(by: disposeBag)
        
        viewModel.placeholderData.asObservable().subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            guard let data = data else { return }
            self.categoryItems = data
            
        }).disposed(by: disposeBag)
        
        viewModel.fetchRequestData()
    }
    
    
    func bindingDataByClosure() {
        viewModel.onUpdateItem = { data in
            guard let data = data else { return }
            
            self.categoryItems = data
            
        }
        
        viewModel.onLoading = { [weak self] loading in
            guard let self = self else { return }
            guard let loading = loading else { return }
            switch loading {
            case .loading:
                print("loading")
                tableView.showAnimatedGradientSkeleton()
            case .failed:
                print("failed")
                tableView.hideSkeleton()
            case .finished:
                tableView.hideSkeleton()
                print("finished")
            default:
                break
            }
        }
        
        viewModel.requestData()
        
    }
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "userPlaceholderTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "userPlaceholderTableViewCell")
        
        
    }
}

extension URLSessionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPlaceholderTableViewCell", for: indexPath) as? userPlaceholderTableViewCell
        cell?.configure(data: categoryItems[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}

extension URLSessionViewController: SkeletonTableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "userPlaceholderTableViewCell"
    }
}
