Pod::Spec.new do |s|
  s.name         = "BPFoundation"
  s.version      = "0.0.1"
  s.summary      = "All the things that Foundation should have, but doesn't."
  s.homepage     = "https://github.com/brianpartridge/BPFoundation"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "Brian Partridge" => "brianpartridge@gmail.com" }
  s.source       = { :git => "https://github.com/brianpartridge/BPFoundation.git", :tag => "0.0.1" }
  s.platform     = :ios
  s.source_files = 'BPFoundation/*.{h,m}'
  s.requires_arc = true
end
