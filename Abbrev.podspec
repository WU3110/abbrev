Pod::Spec.new do |s|
  s.name         = "Abbrev"
  s.version      = "0.0.4"
  s.summary      = "Abbrev is Assorts of Cocoa Framework Category."
  s.homepage     = "http://www.heartlay-studio.co.jp"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = { "Kazuki Saima" => "kazuki.saima@heartlay-studio.co.jp" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "git@bitbucket.org:heartlaystudio/abbrev.git", :tag => "#{s.version}" }
  s.source_files  = "Abbrev", "Abbrev/**/*.{h,m}"
  s.framework  = "QuartzCore"
  s.requires_arc = true
end