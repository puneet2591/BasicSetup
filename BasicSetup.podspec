#
# Be sure to run `pod lib lint BasicSetup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BasicSetup'
  s.version          = '0.1.0'
  s.summary          = 'A small framework used to basic setup for your project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A small framework used to basic setup for your project. Install it in your project and use it.
                       DESC

  s.homepage         = 'https://github.com/puneet2591/BasicSetup'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'puneetonly12@gmail.com' => 'Puneet Mahajan' }
  s.source           = { :git => 'https://github.com/puneet2591/BasicSetup.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'BasicSetup/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BasicSetup' => ['BasicSetup/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.swift_versions = '5.0'
  # s.dependency 'AFNetworking', '~> 2.3'
end
