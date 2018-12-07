#
# Be sure to run `pod lib lint ZPlaceholderTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZPlaceholderTextView'
  s.version          = '0.4.0'
  s.summary          = 'A short description of ZPlaceholderTextView.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sapphirezzz/ZPlaceholderTextView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zack Zheng' => 'zhengzuanzhe@gmail.com' }
  s.source           = { :git => 'https://github.com/sapphirezzz/ZPlaceholderTextView.git', :tag => s.version.to_s }

  s.swift_version = '4.2'
  s.ios.deployment_target = '8.0'
  s.source_files = 'ZPlaceholderTextView/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'

end
