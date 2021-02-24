
//
//  MainViewController.swift
//  Devour(Group project csci 405)
//
//  Created by Dowon on 2/24/21.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    private var collectionView: UICollectionView?
    @IBOutlet weak var mainTableView: UITableView!
    
    private let foodtype = ["burger","noodle","pasta","sushi","burger","sushi","pasta","noodle","burger","burger","pasta","sushi"]
    private let categoryFood = ["burger","noodle","pasta","sushi","burger","sushi","pasta","noodle","burger","burger","pasta","sushi"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.tintColor = .black
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "GillSans-SemiBold", size: 16)!]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 70)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        collectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 70).integral
        guard let foodCollection = collectionView else {
            return
        }
        view.addSubview(foodCollection)
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: collectionView!.bottomAnchor, constant: 20).isActive = true
        mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell
        cell.foodImage.image = UIImage(named: categoryFood[indexPath.row])
        cell.foodImage.layer.cornerRadius = 30
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SwipeViewController") as? SwipeViewController else {
            return
        }
        vc.passedSection = categoryFood[indexPath.row]
        AudioServicesPlaySystemSound(1519)
        present(vc, animated: true)
    }
    
    
    // CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodtype.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
        cell.configure(with: foodtype[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SwipeViewController") as? SwipeViewController else {
            return
        }
        vc.passedSection = categoryFood[indexPath.row]
        AudioServicesPlaySystemSound(1519)
        present(vc, animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        collectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 70).integral
        print(collectionView!.frame.size.height)
    }
    

    

}
