use_frameworks!

target 'TRXTests' do
  pod 'Quick', '~> 0.10.0'
  pod 'Nimble', '~> 5.0.0'
  pod 'Nimble-Snapshots', '~> 4.2.0'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    # Configure Pod targets for Xcode 8 compatibility
    config.build_settings['SWIFT_VERSION'] = '3.0'
    config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = 'ABCDEFGHIJ/'
    config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
  end
end