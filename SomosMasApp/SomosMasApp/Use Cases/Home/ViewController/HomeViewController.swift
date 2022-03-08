//
//  HomeViewController.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 11/02/2022.
//

import UIKit

class HomeViewController: UIViewController{
    
    var homeViewModel = HomeViewModel()
    var newsArray = [News]()
    var newsCollectionView: UICollectionView!
    var newsTitleLabel: UILabel!
    var titleLabel: UILabel!
    var bodyLabel: UILabel!
    var exampleCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBinds()
        self.homeViewModel.getNews()
        self.homeViewModel.getSlides()
        self.setupLabel()
        self.setupCollection()
        self.setupNewsLabel()
        self.setupNewsCollections()
    }
    
    func setupLabel(){
        titleLabel = UILabel()
        self.view.addSubview(titleLabel)
        titleLabel.text = "Bienvenidos"
        titleLabel.font = .systemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupCollection(){
        
        let exampleCollectionsFlow = UICollectionViewFlowLayout()
        exampleCollection = UICollectionView(frame: .zero, collectionViewLayout: exampleCollectionsFlow)
        
        self.view.addSubview(exampleCollection)
        exampleCollection.translatesAutoresizingMaskIntoConstraints = false
        exampleCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        exampleCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        exampleCollection.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 25).isActive = true
        exampleCollection.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        exampleCollection.delegate = self
        exampleCollection.dataSource = self
        
        let nibCell = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        exampleCollection.register(nibCell, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        
        exampleCollectionsFlow.scrollDirection = .horizontal
        exampleCollectionsFlow.itemSize = CGSize(width: view.frame.width * 0.75, height: 315)
        exampleCollectionsFlow.sectionInset.right = 20
        exampleCollectionsFlow.sectionInset.left = 20
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        exit(0)
    }
    
    func setupNewsLabel(){
        newsTitleLabel = UILabel()
        self.view.addSubview(newsTitleLabel)
        newsTitleLabel.text = "Últimas novedades"
        newsTitleLabel.font = .systemFont(ofSize: 20)
        newsTitleLabel.textAlignment = .center
        
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newsTitleLabel.topAnchor.constraint(equalTo: exampleCollection.bottomAnchor, constant: 15).isActive = true
        newsTitleLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        newsTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupNewsCollections() {
        let newsCollectionViewFlow = UICollectionViewFlowLayout()
        newsCollectionViewFlow.itemSize = CGSize(width: view.frame.width * 0.75, height: 240)
        newsCollectionViewFlow.scrollDirection = .horizontal
        newsCollectionViewFlow.sectionInset.left = 12
        newsCollectionViewFlow.sectionInset.right = 12
        
        newsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: newsCollectionViewFlow)
        
        self.view.addSubview(newsCollectionView)
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        newsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newsCollectionView.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 5).isActive = true
        newsCollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
        let nibNews = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(nibNews, forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }
    
    func setBinds() {
        self.homeViewModel.bindStartRequest = {() -> Void in
            print("Inicia la consulta")
        }
        
        self.homeViewModel.bindRequestData = {(_ arrayNews: [News]) -> Void in
            let prefix = arrayNews.prefix(5)
            self.newsArray = Array(prefix)
            self.newsCollectionView.reloadData()
        }
        
        self.homeViewModel.bindRequestSlidesData = {(_ arraySlides: [Slides]) -> Void in
        }
        
        self.homeViewModel.bindErrorMessage = {(_ errorMessage: String) -> Void in
            print(errorMessage)
        }
        
        self.homeViewModel.bindEndRequest = {() -> Void in
            print("Termina la consulta")
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numbersItems: Int = 0
        
        switch collectionView {
        case exampleCollection:
            numbersItems = homeViewModel.images.count
        case newsCollectionView:
            numbersItems = self.newsArray.count
        default:
            print("Error")
        }
        return numbersItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case exampleCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell
            cell?.imageCollectionViewCell.image = homeViewModel.images[indexPath.row].image
            cell?.titleCollectionViewCell.text = homeViewModel.images[indexPath.row].title
            cell?.descriptionCollectionViewCell.text = homeViewModel.images[indexPath.row].text
            return cell ?? SliderCollectionViewCell()
        case newsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell
            cell?.getImage(linkData: newsArray[indexPath.row].image ?? "imagen")
            cell?.newsTitle.text = newsArray[indexPath.row].name
            cell?.newsInfo.text = newsArray[indexPath.row].content?.removeEspecialCharacters
            return cell ?? NewsCollectionViewCell()
        default:
            return NewsCollectionViewCell()
        }
    }
}
