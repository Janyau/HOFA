Pod::Spec.new do |s|
  s.name         = "HOFA"
  s.version      = "1.0.5"
  s.summary      = "A lightweight Objective-C high-order functions library."
  s.description  = <<-DESC
    HOFA is an array-related tool, including safe operation of arrays and custom high-order functions.
  DESC
  s.homepage     = "https://github.com/Janyau/HOFA"
  s.license      = "MIT"
  s.author             = { "Janyau" => "janyaugoo@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/Janyau/HOFA.git", :tag => "#{s.version}" }
  s.source_files  = "HOFA/**/*"
  s.public_header_files = "HOFA/*.h"
  s.frameworks  = "Foundation"
  s.requires_arc = true

  s.subspec 'Safe' do |ss|
    ss.source_files = 'HOFA/Safe/**/*'
    ss.frameworks = 'Foundation'
    ss.ios.deployment_target = '9.0'
  end

  s.subspec 'Timer' do |ss|
    ss.source_files = 'HOFA/Timer/**/*'
    ss.frameworks = 'Foundation'
    ss.ios.deployment_target = '9.0'
  end

  s.subspec 'Throttle' do |ss|
    ss.source_files = 'HOFA/Throttle/**/*'
    ss.frameworks = 'Foundation'
    ss.ios.deployment_target = '9.0'
  end

  s.subspec 'ProtoType' do |ss|
    ss.source_files = 'HOFA/ProtoType/**/*'
    ss.frameworks = 'Foundation'
    ss.ios.deployment_target = '9.0'
  end

end