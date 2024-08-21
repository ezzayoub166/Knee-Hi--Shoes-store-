//
//  OnBoadingViewController.swift
//  Shoes-EcommApp
//
//  Created by ezz on 05/08/2024.
//

import UIKit

class OnBoadingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextButton: UIButton!
    var itemsOnboading : [OnBoadingItem] = []
    
    var currentIndex: Int = 0 {
        didSet {
            pageControl.currentPage = currentIndex
            
            if currentIndex == 0  {

                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
            updatePageControlImages()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.scrollsToTop = false
        collectionView.isScrollEnabled = false
        setUpData()
        isHiddenNavigation = true
        collectionView.register(UINib(nibName: "OnboadinCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboadinCollectionViewCell")
        updatePageControlImages()
        
    }
    
//    @IBAction func nextBtn(_ sender: Any) {
//        currentIndex += 1
//        pageControl.setIndicatorImage(UIImage(named: "selectedP"), forPage: currentIndex)
//        
//        if currentIndex == itemsOnboading.count  {
//            let vc = UIStoryboard.mainStoryBoard.instantiateViewController(identifier: "LoginVC")
//                  vc.rootPush()
//            return
//        }
//        let indexPath = IndexPath(row: currentIndex, section: 0)
//        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        
//    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if currentIndex < itemsOnboading.count - 1 {
            currentIndex += 1
            let indexPath = IndexPath(row: currentIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else {
            let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC")
            vc.rootPush()
        }
    }
    
    private func updatePageControlImages() {
          guard let selectedImage = UIImage(named: "selectedP"), let unselectedImage = UIImage(named: "unSelected") else {
              print("Images not found")
              return
          }
          
          for index in 0..<pageControl.numberOfPages {
              if index == currentIndex {
                  pageControl.setIndicatorImage(selectedImage, forPage: index)
              } else {
                  pageControl.setIndicatorImage(unselectedImage, forPage: index)
              }
          }
      }
    
    
    func setUpData(){
        itemsOnboading.append(OnBoadingItem(title: " Start Journey With Nike", subTitle: "Smart, Gorgeous & Fashionable Collection", image: "onBoadingImage1"))
        itemsOnboading.append(OnBoadingItem(title: "Follow Latest Style Shoes", subTitle: "There Are Many Beautiful And Attractive Plants To Your Room", image: "onBoadingImage2"))
        itemsOnboading.append(OnBoadingItem(title: "Summer Shoes Nike 2022", subTitle: "Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor", image: "onBoadingImage3"))
        pageControl.numberOfPages = itemsOnboading.count
        collectionView.reloadData()
        
    }
    
}

extension OnBoadingViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsOnboading.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboadinCollectionViewCell.identifier, for: indexPath) as! OnboadinCollectionViewCell
        cell.object = itemsOnboading[indexPath.row]
        cell.configure()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}
//Mark :- make extension of UIPageControl
//   
//extension UIPageControl {
//    var page: Int {
//        get {
//            return currentPage
//        }
//        set {
//            currentPage = newValue
//            updateIndicatorImages()
//        }
//    }
//
//    private func updateIndicatorImages() {
//        // Ensure the images are valid
//        guard let selectedImage = UIImage(named: "selectedP"), let unselectedImage = UIImage(named: "unSelected") else {
//            print("Images not found")
//            return
//        }
//        
//        // Set the selected image
//        self.setIndicatorImage(selectedImage, forPage: currentPage)
//        
//        // Set the unselected images
//        for index in 0..<numberOfPages where index != currentPage {
//            self.setIndicatorImage(unselectedImage, forPage: index)
//        }
//    }
//}
