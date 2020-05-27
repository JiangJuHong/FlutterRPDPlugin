#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint rpd_plugin.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'rpd_plugin'
  s.version          = '0.0.1'
  s.summary          = 'Flutter RPD(Rapid plug-in development), which means "the plug-in for Rapid development of Flutter", solves the problem that the redundant code is too high and the efficiency is too low in the development of the Flutter plug-in. Issues and PR are welcome'
  s.description      = <<-DESC
Flutter RPD(Rapid plug-in development), which means "the plug-in for Rapid development of Flutter", solves the problem that the redundant code is too high and the efficiency is too low in the development of the Flutter plug-in. Issues and PR are welcome
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
