use_frameworks!

target 'TRXTests' do
  pod 'Quick', :git => 'https://github.com/Quick/Quick.git'
  pod 'Nimble', '~> 5.0'
  pod 'Nimble-Snapshots', '~> 4.2.0'
  pod 'FBSnapshotTestCase', :git => 'https://github.com/facebook/ios-snapshot-test-case.git'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    # Configure Pod targets for Xcode 8 compatibility
    config.build_settings['SWIFT_VERSION'] = '2.3'
    config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = 'ABCDEFGHIJ/'
    config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
  end
end