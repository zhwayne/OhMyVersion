
Pod::Spec.new do |s|

  s.name                   = "OhMyVersion"
  s.version                = "0.0.4"
  s.summary                = "A better way to compare the version level."
  s.description            = "This library provides a better way to compare the version level."
  s.homepage               = "https://github.com/zhwayne/OhMyVersion"
  s.license                = "MIT"
  s.author                 = { "wayne" => "mrzhwayne@163.com" }
  s.source                 = { :git => "https://github.com/zhwayne/OhMyVersion.git", :tag => "#{s.version}" }
  s.source_files           = "OhMyVersion/**/*"
  s.ios.deployment_target  = '8.0'

end
