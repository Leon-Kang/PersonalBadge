source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
inhibit_all_warnings!
use_frameworks!

project 'PersonalBadge.xcodeproj'

def common_pods
  # Themes
  pod 'ChameleonFramework'
  # Data
  pod 'Realm'
end

def testing_pods

end

target :PersonalBadge do
  common_pods
end

# post_install do |installer|
#   installer.pods_project.targets.each do |target|
#       if ['ChameleonFramework'].include? target.name
#           target.build_configurations.each do |config|
#               config.build_settings['SWIFT_VERSION'] = '3'
#           end
#       end
#   end
# end