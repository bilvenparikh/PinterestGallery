//
//  GalleryViewController.swift
//  PinterestGallery
//
//  Created by 3Embed on 20/08/20.
//  Copyright © 2020 Bilven. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionViewGalleryImages: UICollectionView!
    
    let viewModel = GalleryViewModel()
    // MARK:- ImageLoader Object
    let imageLoader = ImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.getGalleryImages), for: .valueChanged)
        collectionViewGalleryImages.refreshControl = refreshControl
        // MARK:- Adding Observers
        addObservers()
        //MARK:- Refreshing refreshControll on loading data
        collectionViewGalleryImages.refreshControl?.beginRefreshing()
        // MARK:- Getting JSON Data
        viewModel.getJsonData()
    }
    
    // MARK:- UIRefreshcontrol Method
    @objc func getGalleryImages() {
        viewModel.getJsonData()
    }

    
    // MARK:- Adding RxObservers for DataModel
    func addObservers() {
        viewModel.didUpdate = { [weak self] in
            DispatchQueue.main.async {
                if let weakSelf = self {
                    weakSelf.collectionViewGalleryImages.reloadData()
                    weakSelf.collectionViewGalleryImages.refreshControl?.endRefreshing()
                    weakSelf.collectionViewGalleryImages.isHidden = weakSelf.viewModel.numberOfGalleryImages == 0
                    //weakSelf.lblNoData.isHidden = weakSelf.factsVM.numberOfFacts > 0
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfGalleryImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : GalleryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        
        let object = viewModel.getGalleryAtIndex(indexPath.row)
        if let imageUrl = object.urls?.regular {
            imageLoader.obtainImageWithPath(imagePath: imageUrl) { (image) in
                if let updateCell = collectionView.cellForItem(at: indexPath) as? GalleryCollectionViewCell {
                    updateCell.galleryImage.image = image
                }
            }
        } else {
            cell.galleryImage.image = #imageLiteral(resourceName: "placeholder")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (collectionView.frame.size.width / 2) - 1, height: collectionView.frame.size.width / 2)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
