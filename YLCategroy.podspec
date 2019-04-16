#
# Be sure to run `pod lib lint YLCategroy.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLCategroy'
  s.version          = '0.1.0'
  s.summary          = 'LYL Categroy'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LYongLiang/YLCategroy'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYongLiang' => 'liangyl0515@163.com' }
  s.source           = { :git => 'git@github.com:LYongLiang/YLCategroy.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  
  s.subspec 'YLAddition' do |aaa|
      aaa.source_files = 'YLCategroy/Classes/YLAddition/**/*'
  end

  
  # s.resource_bundles = {
  #   'YLCategroy' => ['YLCategroy/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
