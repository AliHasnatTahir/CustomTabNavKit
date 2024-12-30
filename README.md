# CustomTabNavKit

CustomTabNavKit is a lightweight, customizable iOS library that provides a custom tab bar integrated with a navigation controller. It is designed to help you implement a modern, sleek tab bar system with built-in navigation capabilities, perfect for iOS apps that require dynamic navigation along with tab-based UI navigation.

## Features

- **Customizable Tab Bar**: Easily customize the look and feel of the tab bar, including colors, icons, and text.
- **Navigation Support**: Each tab has an associated `UIViewController`, and when a tab is selected, the corresponding view controller is displayed within a `UINavigationController`.
- **Easy to Use**: Simply provide tab bar items and corresponding view controllers, and the library does the rest.
- **Responsive Design**: The library is built with flexibility in mind, working seamlessly across different device sizes.

## Installation

### CocoaPods

To install `CustomTabNavKit` via CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'CustomTabNavKit', '~> 1.0.0'

```
Then, run:

```ruby

pod install

```

This will install the CustomTabNavKit library in your project.

## Manual Installation
1. Download the repository as a ZIP file and extract it.
2. Drag and drop the Classes folder into your Xcode project.
3. Make sure to add the required frameworks and dependencies.


## Usage
To use CustomTabNavKit, follow these steps:

1. Import the Library: Import CustomTabNavKit in your ViewController or App Delegate.

```ruby
import CustomTabNavKit
```

2. Set Up CustomTabNavKit:
Create an instance of CustomTabBarController and pass the required parameters, such as the tab bar items and the view controllers associated with each tab.

```ruby
let tabbarItems = ["Home", "Search", "Profile"]
let viewControllers: [UIViewController] = [homeVC, searchVC, profileVC]

let customTabBarController = CustomTabBarController(tabbarItems: tabbarItems, viewControllers: viewControllers, selectedIndex: 0)

let navigationController = UINavigationController(rootViewController: customTabBarController)
navigationController.setNavigationBarHidden(true, animated: false)

guard let window = UIApplication.shared.windows.first else {
    print("No available window.")
    return
}

window.rootViewController = navigationController
window.makeKeyAndVisible()
```

3. Customizing the Tab Bar:
You can customize the appearance of the tab bar by modifying the CustomTabBarView class or using your own custom cells.

```ruby
customTabBarView.backgroundColor = .white
customTabBarView.selectedIndex = 1 // Programmatically select a tab
```


## Example
Here’s a simple example to show how CustomTabNavKit is integrated:
```ruby
import CustomTabNavKit

let tabbarItems = ["Home", "Search", "Profile"]
let viewControllers: [UIViewController] = [homeVC, searchVC, profileVC]

let customTabBarController = CustomTabBarController(tabbarItems: tabbarItems, viewControllers: viewControllers, selectedIndex: 0)
let navigationController = UINavigationController(rootViewController: customTabBarController)
navigationController.setNavigationBarHidden(true, animated: false)

window.rootViewController = navigationController
window.makeKeyAndVisible()
```

## Requirements
- iOS 9.0+
- Xcode 12.0+
- Swift 5.0+

### License
CustomTabNavKit is released under the MIT License. 

## Contributing
We welcome contributions! Please feel free to open issues or submit pull requests. Make sure to follow the standard GitHub workflow:

- Fork the repository.
- Create a new branch (git checkout -b feature-name).
- Make your changes.
- Commit your changes (git commit -am 'Add new feature').
- Push to the branch (git push origin feature-name).
- Create a new pull request.


## Author
- Ali Hasnat Tahir - alihasnat861@gmail.com 
## Acknowledgements
Localize-Swift for localization support.
