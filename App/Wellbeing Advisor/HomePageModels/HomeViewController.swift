//
//  ViewController.swift
//  Wellbeing Advisor
//
//  Created by Henry Bai on 25/08/19.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
    let homePageTiles: [HomeTileModel] = [HomeTileModel(image:#imageLiteral(resourceName: "real_time_data.png"), name: "Current Data Readings"),
                                          HomeTileModel(image: #imageLiteral(resourceName: "data_analysis.png"), name: "Data Anaylsis"),
                                          HomeTileModel(image: #imageLiteral(resourceName: "record_an_event.png"), name: "Record an event"),
                                          HomeTileModel(image: #imageLiteral(resourceName: "settings.png"), name: "Setting")]
    
    
    //    let homePageTiles: [HomeTileModel] = [HomeTileModel(image:#imageLiteral(resourceName: "current_data_readings.png"), name: "Current Data Readings"),
    //                                          HomeTileModel(image: #imageLiteral(resourceName: "data_analysis.png"), name: "Data Anaylsis"),
    //                                          HomeTileModel(image: #imageLiteral(resourceName: "user_input.png"), name: "User Input"),
    //                                          HomeTileModel(image: #imageLiteral(resourceName: "future_trends.png"), name: "Future Trends")]
    
    var tileWidth = 150.0
    var tileMargin = 15.0
    
    //loads the colletionView accordingly
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "HomeTile", bundle: nil), forCellWithReuseIdentifier: "HomeTile")
        
        //calls the grid view method
        self.setupGridView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.tileMargin)
        flow.minimumLineSpacing = CGFloat(self.tileMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageTiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTile", for: indexPath) as! HomeTile
        cell.configure(with: homePageTiles[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath == [0, 1]){
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataAnaylsis") as UIViewController
            self.present(viewController, animated: false, completion: nil)
            
        }
        
        if(indexPath == [0, 2]){
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "recordAnEvent") as UIViewController
            self.present(viewController, animated: false, completion: nil)
            
        }
        
        if(indexPath == [0, 3]){
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Settings") as UIViewController
            self.present(viewController, animated: false, completion: nil)
            
        }
        
        
        
        /*
        if(indexPath == [0, 3]){
            //record an event
        }
 */
        
//        print(indexPath)
//
//        if(indexPath == [0, 3]){
//            //settings
//            let viewController:UIViewController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "Settings") as UIViewController
//            self.present(viewController, animated: false, completion: nil)
//        }
 
        
    }
}

//makes boxes in home page responsive to different screen sizes and orientations
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(tileWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(tileMargin * 2)
        let width = (self.view.frame.size.width - CGFloat(tileMargin) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}






