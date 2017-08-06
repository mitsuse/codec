Pod::Spec.new do |spec|
  spec.name = 'Codec'
  spec.version = '0.3.0'
  spec.homepage = 'https://github.com/mitsuse/codec-swift'
  spec.authors = {
    'Tomoya Kose' => 'tomoya@mitsuse.jp'
  }
  spec.summary = 'Protocols and functions for decoder and encoder.'
  spec.source = { :git => 'https://github.com/mitsuse/codec-swift.git' }
  spec.ios.deployment_target = '8.0'
  spec.source_files = 'Sources/*.swift'
  spec.dependency 'Result', '~> 3.2.0'
end
