Pod::Spec.new do |s|
  s.name         = "Cmg"
  s.version      = "1.1.0"
  s.summary      = "Easy image filtering library of using Core Image."
  s.homepage     = "https://github.com/xxxAIRINxxx/Cmg"
  s.license      = 'MIT'
  s.author       = { "Airin" => "xl1138@gmail.com" }
  s.source       = { :git => "https://github.com/xxxAIRINxxx/Cmg.git", :tag => s.version.to_s }

  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.source_files = 'Sources/*.swift'
end
