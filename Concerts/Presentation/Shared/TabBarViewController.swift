//
//  TabBarViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    enum Page: CaseIterable {
        case discover, savedConcerts, tickets, myAccount
        
        var image: UIImage {
            switch self {
            case .discover: return .init(systemName: "music.mic")!
            case .savedConcerts: return .init(systemName: "bookmark")!
            case .tickets: return .init(systemName: "ticket")!
            case .myAccount: return .init(systemName: "person")!
            }
        }
    }
    
    private var shapeLayer: CAShapeLayer! = nil
    private var blurView: UIVisualEffectView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = makeControllers()
    
  
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.selectionIndicatorTintColor = .systemRed
  
        UITabBar.appearance().tintColor = .systemRed
    
        
        tabBar.standardAppearance = appearance //
        tabBar.scrollEdgeAppearance = appearance
        
        
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 8, y: tabBar.bounds.minY - 8, width: tabBar.bounds.width - 16, height: tabBar.bounds.height + 10), cornerRadius: (tabBar.frame.width/2)).cgPath
        
        shapeLayer.isHidden = false
        shapeLayer.masksToBounds = false
        shapeLayer.fillColor = .none
        shapeLayer.fillColor = UIColor.systemGray6.cgColor
        
//        blurView = UIVisualEffectView(effect:UIBlurEffect(style: .regular))
//        blurView?.frame = shapeLayer.frame
        
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
    
        tabBar.itemWidth = tabBar.bounds.width / CGFloat(Page.allCases.count)
        tabBar.itemPositioning = .centered
        
        // tabBar.insertSubview(blurView, at: 0)
    }
    
    
    func makeControllers() -> [UIViewController] {
        
        Page.allCases.compactMap({ page in
            
            var navigationController: UINavigationController
            
            switch page {
            case .discover:
                navigationController = UINavigationController(rootViewController: DiscoverViewController())
            case .savedConcerts:
                navigationController =  UINavigationController(rootViewController: SavedViewController())
                navigationController.tabBarItem.title = nil
               
            case .tickets:
                 navigationController = UINavigationController(rootViewController: TicketViewController())
            case .myAccount:
                 navigationController = UINavigationController(rootViewController: AccountViewController())
            }
          
            navigationController.tabBarItem.image = page.image
            return navigationController
        })
    }

}
