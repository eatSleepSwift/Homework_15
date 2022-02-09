//
//  ZoomViewController.swift
//  Homework_15
//
//  Created by Artsiom Kanashkou on 6.02.22.
//

import UIKit

class ZoomViewController: UIViewController {
    
    var imageName = ""
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scrollView = UIScrollView()
        
        if let image = UIImage(named: imageName) {
            let imageView = UIImageView(image: image)
            scrollView.addSubview(imageView)
            scrollView.contentSize = image.size
            print(imageName)
        }
    }
}
