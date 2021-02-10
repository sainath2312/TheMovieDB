//
//  ActivityIndicator.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import Foundation
import UIKit

//MARK;- Properties
var activityView:UIView?


//MARK: - Activity Indicator
class ActivityIndicator: NSObject {
    static let sharedInstance = ActivityIndicator()
    func showActivityIndicator()
    {
        if activityView == nil{
        activityView = UIView(frame: (UIApplication.shared.keyWindow?.frame)!)
        activityView?.backgroundColor = UIColor.black
        activityView?.alpha  = 0.6
        var activity = UIActivityIndicatorView()
            activity = UIActivityIndicatorView.init(style: .white)
        activity.center = (activityView?.center)!
        activity.startAnimating()
        activityView?.addSubview(activity)
        UIApplication.shared.keyWindow?.addSubview(activityView!)
        }
    }
    func showActivityIndicatorOnView(_ view: UIView)
    {
        if activityView == nil{
            activityView = UIView(frame: (view.frame))
            activityView?.backgroundColor = UIColor.black
            activityView?.alpha  = 0.6
            var activity = UIActivityIndicatorView()
            activity = UIActivityIndicatorView.init(style: .white)
            activity.center = (activityView?.center)!
            activity.startAnimating()
            activityView?.addSubview(activity)
           view.addSubview(activityView!)
        }
    }
    func hideActivityIndicator()
    {
        if activityView != nil{
        activityView?.removeFromSuperview()
        activityView = nil
        }
    }
}
