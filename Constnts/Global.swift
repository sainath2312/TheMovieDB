//
//  Global.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import Foundation
import UIKit
import SDWebImage

class Global: UILabel {
    
    static let sharedInstance = Global()
    
    func showAlert(_ message: String, _ title: String)  {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil))
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alert, animated: true, completion: nil)
            // topController should now be your topmost view controller
        }
    }
    
    func jsonToString(json: AnyObject) -> String {
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            return String(data: data1, encoding: String.Encoding.utf8) ?? "" // the data will be converted to the string
        } catch let myJSONError {
            print(myJSONError)
            return ""
        }
    }
    
    func imageLoad(imgView :UIImageView,url :String)
    {
        imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "gallery-placeholder"))
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()

        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}

