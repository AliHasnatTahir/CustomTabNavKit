//
//  CustomTabNavKit.swift
//  CustomTabNavKit
//
//  Created by Ali Hasnat on 29/12/2024.
//

import UIKit

public class CustomTabNavKit: UIViewController, CustomTabBarViewDelegate {
    
    private var customTabBarView: CustomTabBarView!
    private var tabbarItems: [String] = []
    private var viewControllers: [UIViewController] = []
    private var navController: UINavigationController!
    private var selectedIndex: Int = 0

    init(tabbarItems: [String], viewControllers: [UIViewController], selectedIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        
        guard tabbarItems.count == viewControllers.count else {
            fatalError("The number of tab bar items must match the number of view controllers.")
        }
        
        self.tabbarItems = tabbarItems
        self.viewControllers = viewControllers
        self.selectedIndex = selectedIndex
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavController()
        setupCustomTabBarView()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateCustomTabBarFrame()
    }

    private func setupNavController() {
        let firstVC = viewControllers[selectedIndex]
        navController = UINavigationController(rootViewController: firstVC)
        navController.setNavigationBarHidden(true, animated: false)
        self.view.addSubview(navController.view)
        addChild(navController)
        navController.didMove(toParent: self)
    }

    private func setupCustomTabBarView() {
        customTabBarView = CustomTabBarView(frame: .zero, tabbarItems: tabbarItems)
        customTabBarView.delegate = self
        self.view.addSubview(customTabBarView)
        customTabBarView.reloadData(index: selectedIndex)
    }

    private func updateCustomTabBarFrame() {
        let tabBarHeight: CGFloat = UIDevice().userInterfaceIdiom == .pad ? 100 : 80
        let customTabBarFrame = CGRect(
            x: 0,
            y: self.view.frame.height - tabBarHeight,
            width: self.view.frame.width,
            height: tabBarHeight
        )
        customTabBarView.frame = customTabBarFrame
        navController.view.frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.width,
            height: self.view.frame.height - tabBarHeight
        )
    }

    // MARK: - CustomTabBarViewDelegate
    
    func didSelectTab(index: Int) {
        setSelectedIndex(index)
    }
    
    func setSelectedIndex(_ index: Int) {
        guard index < viewControllers.count else { return }
        
        selectedIndex = index
        let selectedVC = viewControllers[index]
        
        if navController.topViewController != selectedVC {
            navController.setViewControllers([selectedVC], animated: false)
        }
        
        customTabBarView.reloadData(index: selectedIndex)
    }
}
