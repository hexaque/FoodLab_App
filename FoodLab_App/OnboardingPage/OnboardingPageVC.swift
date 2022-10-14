//
//  OnboardingPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class OnboardingPageVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonNext: UIButton!
    
    var onboardingSlides : [OnboardSlides] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            pageControl.currentPage = currentPage
            if currentPage == onboardingSlides.count - 1 {
                buttonNext.setTitle("Get Started", for: .normal)
            } else {
                buttonNext.setTitle("Next", for: .normal)
            }
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        onboardingSlides = [
            
            OnboardSlides(title: "Delicious Dishes", desc: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardSlides(title: "World-Class Chefs", desc: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardSlides(title: "Instant World-Wide Delivery", desc: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]

        
    }
    

    @IBAction func buttonNextClicked(_ sender: UIButton) {
        if currentPage == onboardingSlides.count-1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "welcomePage") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

    }
    
    
    

    
}

extension OnboardingPageVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.setup(slide: onboardingSlides[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
    
}
