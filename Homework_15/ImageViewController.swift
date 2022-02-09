import UIKit

class ImageViewController: UIViewController {
    var imageName = ""
    @IBOutlet weak var zoomScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: imageName) {
            let imageView = UIImageView(image: image)
            zoomScrollView.addSubview(imageView)
            zoomScrollView.contentSize = image.size
        }
    }
}
