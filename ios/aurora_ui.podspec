Pod::Spec.new do |s|
  s.name             = 'aurora_ui'
  s.version          = '1.0.0'
  s.summary          = 'Premium iOS glass UI for Flutter.'
  s.description      = <<-DESC
Premium iOS glass UI for Flutter with semantic materials and native visual effects.
                       DESC
  s.homepage         = 'https://github.com/appamania/aurora_ui'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Sumit Pal' => 'sumit@appamania.in' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
