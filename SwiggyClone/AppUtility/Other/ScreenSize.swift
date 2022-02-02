
import UIKit

//MARK:- Screen resolution
struct ScreenSize {
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static var heightAspectRatio: CGFloat {
        return UIScreen.main.bounds.size.height / 667
    }
    
    static var widthAspectRatio: CGFloat {
        return UIScreen.main.bounds.size.width / 375
    }
    
    static var fontAspectRatio : CGFloat {
        if UIDevice().userInterfaceIdiom == .pad {
            return UIScreen.main.bounds.size.height / 667
        }
        
        let size = UIScreen.main.bounds.size
        
        if size.width < size.height {//Potrait
            return UIScreen.main.bounds.size.width / 375
            
        } else {//Landscape
            return UIScreen.main.bounds.size.height / 375
        }
    }
    
    static var cornerRadious: CGFloat {
        return 10
    }
}
