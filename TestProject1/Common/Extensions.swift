import Foundation
import UIKit
// MARK: - Properties
let imageCache = NSCache<NSString, UIImage>()
let constants: Constants = Constants()
// MARK: - extension UIImageView
extension UIImageView {
    
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        // Check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        // Create UIActivityIndicatorView
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            // Add UIImage to NSCache
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
        }).resume()
    }
}

extension UIButton {
    
    func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = constants.animationPosition
        animation.values = constants.animationValues
        animation.keyTimes = constants.animationTimes
        animation.duration = constants.animationDuration
        animation.isAdditive = true
        layer.add(animation, forKey: constants.animationKey)
    }
}
