Pod::Spec.new do |s|
  s.name         = "LUAutocompleteView"
  s.version      = "4.0.0"
  s.summary      = "Highly configurable autocomplete view that is attachable to any UITextField"
  s.description  = "Easy to use and highly configurable autocomplete view that is attachable to any UITextField"

  s.homepage     = "https://github.com/LaurentiuUngur/LUAutocompleteView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.source       = { :git => "https://github.com/LaurentiuUngur/LUAutocompleteView.git", :tag => "#{s.version}" }
  s.author       = { "Laurentiu Ungur" => "laurentyu1995@gmail.com" }
  
  s.requires_arc = true
  s.platform     = :ios, "12.0"
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.6.0'
  
  s.source_files   = "Sources/*.{swift}"
  s.preserve_paths = "README*"
end
