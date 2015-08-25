Pod::Spec.new do |s|
  s.name     = 'LROptional'
  s.version  = '0.1'
  s.license  = 'MIT'
  s.summary  = 'A simple NSObject category to simplify sending optional messages to objects.'
  s.homepage = 'https://github.com/luisrecuenco/LROptional'
  s.author   = { "Luis Recuenco" => "luis.recuenco@gmail.com" }
  s.source   = { :git => 'https://github.com/luisrecuenco/LROptional.git', :tag => '0.1' }
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
  s.source_files = 'NSObject+LROptional.{h,m}'
  s.requires_arc = true
end
