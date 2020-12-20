require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-ig-story-share"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.author       = 'bobwei'
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/bobwei/react-native-ig-story-share", :tag => "v#{s.version}" }
  s.source_files  = "ios/*.{h,m}"
  s.dependency "React"
end
