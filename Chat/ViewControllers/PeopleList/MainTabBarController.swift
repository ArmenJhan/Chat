//
//  MainTabBarController.swift
//  Chat
//
//  Created by Armen Madoyan on 11.03.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let currentUser: MUser
    
    init(currentUser: MUser = MUser(
        username: "Name",
        email: "email",
        userImageString: "photo",
        description: "description",
        sex: "sex",
        id: "id ")
    ) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appear = UITabBarAppearance()
        tabBar.standardAppearance = appear
        tabBar.scrollEdgeAppearance = appear
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        
        let listViewController = ListViewController(currentUser: currentUser)
        let peopleViewController = PeopleViewController(currentUser: currentUser)
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        
        let peopleImage = UIImage(systemName: "person.2")
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)
        
        viewControllers = [
            setNavigationController(
                peopleViewController,
                title: "People",
                image: peopleImage ?? UIImage()
            ),
            setNavigationController(
                listViewController,
                title: "Conversations",
                image: conversationImage ?? UIImage()
            )
        ]
    }
    
    private func setNavigationController(_ rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.barTintColor = .mainWhite()
        
        // объявляем свойство для настройки navigationBar
        let navBarAppearance = UINavigationBarAppearance()
        // задаем цвет для navigationBar
        navBarAppearance.backgroundColor = .mainWhite()
        navBarAppearance.shadowColor = .mainWhite()
        // стандартный режим
        navigationVC.navigationBar.standardAppearance = navBarAppearance
        // scrollEdge  режим
        navigationVC.navigationBar.scrollEdgeAppearance = navBarAppearance

        return navigationVC
    }
}

// MARK: - SwiftUI Canvas
import SwiftUI

struct MainTabBarControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some MainTabBarController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
