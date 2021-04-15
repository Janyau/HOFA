Pod::Spec.new do |s|
  s.name         = "HOFA"
  s.version      = "1.0.2"
  s.summary      = "A lightweight Objective-C high-order functions library."
  s.description  = <<-DESC
    HOFA is an array-related tool, including safe operation of arrays and custom high-order functions.
  DESC
  s.homepage     = "https://github.com/Janyau/HOFA"
  s.license      = "MIT"
  s.author             = { "Janyau" => "janyaugoo@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/Janyau/HOFA.git", :tag => "#{s.version}" }
  s.source_files  = "HOFA/*.{h,m}"
  s.public_header_files = "HOFA/*.h"
  s.frameworks  = "Foundation"
  s.requires_arc = true

end