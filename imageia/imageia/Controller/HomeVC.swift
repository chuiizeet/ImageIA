//
//  HomeVC.swift
//  imageia
//
//  Created by imac on 8/10/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit
import TCMask

class HomeVC: UIViewController, TCMaskViewDelegate {
    
    // MARK: - Properties
    
    
    // MARK: - Init
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentTCMaskView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()

    }
    
    // MARK: - Helper Functions
    
    func setupViewComponents() {
        
        
    }
    
    func presentTCMaskView() {
        let image = UIImage(named: "test2")!
        let maskView = TCMaskView(image: image)
        maskView.delegate = self
        maskView.initialTool = .quickSelect
        maskView.initialState = .subtract
        
        let viewMode = TCMaskViewMode.transparent()
        maskView.viewModes = [viewMode]
        

        maskView.presentFrom(rootViewController: self, animated: true)
    }
    
}

extension UIImage {
    func convertToGrayScaleNoAlpha() -> UIImage {
        let colorSpace = CGColorSpaceCreateDeviceGray();
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(self.cgImage!, in: CGRect(origin: CGPoint(), size: size))
        return UIImage(cgImage: context!.makeImage()!)
    }
}
