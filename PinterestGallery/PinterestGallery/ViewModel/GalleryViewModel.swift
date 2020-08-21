//
//  FactsViewModel.swift
//  Facts
//
//  Created by 3Embed on 18/07/20.
//  Copyright © 2020 Bilven. All rights reserved.
//

import UIKit

class GalleryViewModel: NSObject {
    // MARK:- Shared Instance
    static var shared: GalleryViewModel = {
        let gallery = GalleryViewModel()
        return gallery
    }()
    // MARK:- Array of Gallery
    private var arrGallery = [GalleryObject]()
    // MARK:- Completion Block
    var didUpdate: (() -> Void)?

    // MARK:- Returns total number of Facts
    var numberOfGalleryImages: Int {
        return arrGallery.count
    }

    // MARK:- Return Fact object on Index
    func getGalleryAtIndex(_ index: Int) -> GalleryObject {
        return arrGallery[index]
    }

    // MARK:- Downloads JSON File and stores in Facts Array
    func getJsonData() {
        getDataFromJSON { [weak self] (data) in
            guard let weakself = self else { return }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    weakself.arrGallery = try decoder.decode([GalleryObject].self, from: data)
                    
                    if let didUpdate = weakself.didUpdate {
                        didUpdate()
                    }
                }
                catch {
                    if let didUpdate = weakself.didUpdate {
                        didUpdate()
                    }
                }
            } else {
                if let didUpdate = weakself.didUpdate {
                    didUpdate()
                }
            }
        }
    }

    // MARK:- Downloads JSON File
    private func getDataFromJSON(completion: @escaping (Data?) -> ()) {
        guard let downloadURL = URL.init(string: AppConstants.NetworkURLConstants.downloadURL) else { return }
        Downloader.load(url: downloadURL) { success in
            let path = NSURL.fileURL(withPath: NSTemporaryDirectory() + AppConstants.FileNames.gallery)
            if !FileManager.default.fileExists(atPath: path.absoluteString) {
                do {
                    let data = try Data(contentsOf: URL(string: path.absoluteString)!)
                    let responseStr = String(data: data, encoding: String.Encoding.isoLatin1)
                    guard let modifiedData = responseStr?.data(using: String.Encoding.utf8) else { return }
                    completion(modifiedData)
                } catch {
                    completion(nil)
                }
            }
        }
    }
}

