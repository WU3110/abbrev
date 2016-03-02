Pod::Spec.new do |s|
  s.name         = "Abbrev"
  s.version      = "1.0"
  s.summary      = "Abbrev is Assorts of Cocoa Framework Category."
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author       = { "Kazuki Saima" => "kazuki.saima@vapes.jp" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "git@bitbucket.org:vapesinc/abbrev.git", :tag => "#{s.version}" }
  s.source_files = "Abbrev", "Abbrev/**/*.{h,m}"
  s.framework    = "QuartzCore", "Social", "Accounts"
  s.requires_arc = true
  s.homepage     = "https://github.com/WU3110/abbrev"
end
