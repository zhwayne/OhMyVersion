
Pod::Spec.new do |s|
  s.name         = "OhMyVersion"
  s.version      = "0.0.3"
  s.summary      = "A better way to compare the version level."
  s.description  = <<-DESC
                   DESC
  s.homepage     = "https://github.com/zhwayne/OhMyVersion"
  s.license      = "MIT"
  s.author             = { "wayne" => "mrzhwayne@163.com" }
  
  s.ios.deployment_target = '8.0'
  
  s.source       = { :git => "https://github.com/zhwayne/OhMyVersion.git", :tag => "#{s.version}" }
  s.source_files  = "OhMyVersion/**/*"


end
