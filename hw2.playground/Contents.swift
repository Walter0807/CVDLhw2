//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}
//

extension UIImage {
    func getBrighter(pos: CGPoint) -> UIImage {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) + 30
        let g = CGFloat(data[pixelInfo+1]) + 30
        let b = CGFloat(data[pixelInfo+2]) + 30
        let a = CGFloat(data[pixelInfo+3])
        
        data[pixelInfo] = r
        data[pixelInfo+1] = g
        data[pixelInfo+2] = b
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}


public func grabCut(_ img: UIImage) -> UIImage {
    let width = Int(img.size.width)
    let height = Int(img.size.height)
////    for i in 0..<width {
//        for j in 0..<height {
//            print(j, img.getPixelColor(pos: CGPoint(x:width/2,y:j)))
//        }
////    }
    return img
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        let userimage = #imageLiteral(resourceName: "IMG_6280.JPG")
        let scaler = 400/userimage.size.width
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 40
            , y: 50, width: userimage.size.width*scaler, height: userimage.size.height*scaler)
        imageView.image = grabCut(userimage)
        view.addSubview(imageView)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()