//
//  NewSceneDelegate.swift
//  Chapter03-TabBar
//
//  Created by 심찬영 on 2021/01/20.
//

import UIKit

class NewSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 탭 바 컨트롤러를 생성하고, 배경을 흰색으로 채움
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        // 완성된 tbC를 루트 뷰 컨트롤러로 등록
        self.window?.rootViewController = tbC
        
        // 탭 바 아이템에 연결될 뷰 컨트롤러 객체 생성
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        // 생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록
        tbC.setViewControllers([view01, view02, view03], animated: false)
        
        // 개별 탭 바 아이템 속성 설정
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photd"), selectedImage: nil)
        
        
    }
}
