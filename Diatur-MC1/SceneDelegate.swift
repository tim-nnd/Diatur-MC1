//
//  SceneDelegate.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 06/04/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // **** For Home Page *****
        /*
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainOverviewVC = mainStoryboard.instantiateViewController(withIdentifier: "OverviewVC") as! OverviewViewController
        self.window?.rootViewController = mainOverviewVC
        self.window?.makeKeyAndVisible()

        */

        /*
        

        // ******************
        
        // *****FOR TASK DETAIL******
        
        let taskDetailStoryboard = UIStoryboard.init(name: "TaskDetail", bundle: nil)
        let taskDetailVC = taskDetailStoryboard.instantiateViewController(withIdentifier: "taskDetail") as! TaskDetailViewController
        self.window?.rootViewController = taskDetailVC
        self.window?.makeKeyAndVisible()
        
        // ***************
        
 */
        
        // ****FOR FIRST SETUP***
        
         let firstSetupStoryBoard = UIStoryboard.init(name: "OnBoarding", bundle: nil)
        let firstSetupViewController = firstSetupStoryBoard.instantiateViewController(withIdentifier: "onBoarding") as! OnboardingVC
        self.window?.rootViewController = firstSetupViewController
        self.window?.makeKeyAndVisible()
         
        
        // ****
        
        // ****FOR SETTING DETAIL***
        /*
        let settingDetailStoryBoard = UIStoryboard.init(name: "SettingDetail", bundle: nil)
        let settingDetailViewController = settingDetailStoryBoard.instantiateViewController(withIdentifier: "settingDetailWork") as! SettingDetailViewController
        self.window?.rootViewController = settingDetailViewController
        self.window?.makeKeyAndVisible()
        // ****
 */
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
   

}

