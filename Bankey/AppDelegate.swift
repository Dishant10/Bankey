//
//  AppDelegate.swift
//  Bankey
//
//  Created by Dishant Nagpal on 11/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let dummyVC = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        dummyVC.delegate = self
        window?.rootViewController = loginViewController
        
        return true
    }
    
}

extension AppDelegate : LoginViewControllerDelegate,OnboardingContainerViewControllerDelegate,DummyViewControllerDelegate{
    func didLogout() {
        setRootViewController(loginViewController)
    }
    
    func didFinishingOnboarding() {
        
        setRootViewController(dummyVC)
        LocalState.hasOnboarded = true
    }
    
    func didLogin() {
        if LocalState.hasOnboarded == false {
            setRootViewController(onboardingViewController)
        }else{
            setRootViewController(dummyVC)
        }
    }
}

extension AppDelegate {
    
    func setRootViewController(_ vc : UIViewController,animated : Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3,options: .transitionCrossDissolve, animations: nil)
        
    }
    
}
