import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        RemoteConfigManager.shared.fetchAndStoreRemoteConfig()
        
        if let tokenData = KeychainHelper.shared.read(forKey: "firebaseAuthToken"),
           let token = String(data: tokenData, encoding: .utf8) {
            let tabBar = MainTabBarController()
            tabBar.modalPresentationStyle = .fullScreen
            let navigation = UINavigationController(rootViewController: tabBar)
            window.rootViewController = navigation
            window.makeKeyAndVisible()
            self.window = window
            UINavigationBar.appearance().isHidden = false
        } else {
            createOnboardingVC(window: window)
        }
    }
    
    func createOnboardingVC(window: UIWindow) {
        
         let vc =  OnBoardViewController()
            let navigation = UINavigationController(rootViewController: vc)
            window.rootViewController = navigation
            window.makeKeyAndVisible()
            self.window = window
        
    }
    
    func handleLogout() {
        KeychainHelper.shared.delete(forKey: "firebaseAuthToken")
        
        let vc = OnBoardViewController()
        let navigation = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigation
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
    }
}
