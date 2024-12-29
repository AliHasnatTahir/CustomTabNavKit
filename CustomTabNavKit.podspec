Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ――― #
  spec.name         = "CustomTabNavKit"
  spec.version      = "1.0.0"
  spec.summary      = "A customizable tab bar with navigation controller support."
  spec.description  = <<-DESC
    CustomTabNavKit is a lightweight library providing a custom tab bar integrated
    with a navigation controller. Ideal for building modern iOS applications.
  DESC
  spec.homepage     = "https://github.com/AliHasnatTahir/CustomTabNavKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ali Hasnat Tahir" => "alihasnat861@gmail.com" }
  spec.source       = { :git => "https://github.com/AliHasnatTahir/CustomTabNavKit.git", :tag => "#{spec.version}" }

  # ――― Platform Specifics ――― #
  spec.ios.deployment_target = "13.0"

  # ――― Source Code ――― #
  spec.source_files = "CustomTabNavKit/**/*.{swift}" # Assuming your code is in 'Sources/' directory

  # ――― Resources ――― #
  spec.resource_bundles = {
    'CustomTabNavKitResources' => ['Resources/**/*']
  }

  # ――― Dependencies ――― #
  spec.requires_arc = true

  # Example: If your library depends on other pods
  # spec.dependency "Alamofire", "~> 5.4"

end
