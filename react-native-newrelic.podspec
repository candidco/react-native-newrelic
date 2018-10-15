#
# Be sure to run `pod lib lint react-native-newrelic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name             = 'react-native-newrelic'
  s.version             = package['version']
  s.summary             = package['description']
  s.description         = package['description']
  s.homepage            = package['homepage']
  s.license             = package['license']
  s.author              = package['author']

  s.source           = { :git => 'https://github.com/candidco/react-native-newrelic.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.2'

  s.dependency 'React'
  s.dependency 'NewRelicAgent', '~> 6.3'
  
  s.ios.xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/NewRelicAgent/NewRelicAgent"',
    'OTHER_LDFLAGS' => '-framework NewRelicAgent'
  }

  s.preserve_paths = 'README.md', 'LICENSE', 'package.json'

  s.source_files        = 'ios/**/*.{h,m}'
  s.exclude_files       = 'android/**/*'
  
end
