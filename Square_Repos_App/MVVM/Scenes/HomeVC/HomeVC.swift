//
//  HomeVC.swift
//  SquareReposApp
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var firstDeliveryName: UILabel!
    @IBOutlet weak var secondDeliveryName: UILabel!
    @IBOutlet weak var ReposTableView: UITableView!
    
    var homeViewModel : HomeList_VM?
    var coordinator : HomeCoordinator?
   
    func initialState(viewModel:HomeList_VM) {
        self.homeViewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBinder()
   
        ReposTableView.dataSource = self
        ReposTableView.delegate = self
        ReposTableView.register(UINib.init(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeViewModel?.viewWillAppear()
    }
    
    func setupBinder(){
        homeViewModel?.separateRepos.bind{
            [weak self] repositories in
            guard let strongSelf = self else{return}
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
                strongSelf.showActivityView(isShow: false)
                strongSelf.ReposTableView.reloadData()
                strongSelf.ReposTableView.alpha = 1
            }
        }
        homeViewModel?.reposWillSet.bind{
            [weak self] isShowActivityView in
            guard let strongSelf = self else{return}
            strongSelf.showActivityView(isShow: true)
        }
    }
    
    
    
}
