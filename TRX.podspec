Pod::Spec.new do |s|
  s.name             = "TRX"
  s.version          = "0.3.1"
  s.summary          = "Squeeze, chain, overlap, seek. A powerful swift animation framework."
  s.description      = <<-DESC
                        A versatile animation framework built with ease of use, powerful features and performance in mind. TRX is inspired by the the excellent JavaScript animation framework GSAP.
                      DESC

  s.homepage         = "https://github.com/Trxy/TRX"
  s.screenshots      = "https://trxy.github.io/TRX/trx.png"
  s.license          = 'MIT'
  s.author           = "Adam Modzelewski"
  s.source           = { :git => "https://github.com/Trxy/TRX.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AKModzelewski'

  s.ios.deployment_target = '8.4'
  s.tvos.deployment_target = '9.0'

  s.requires_arc = true
  s.source_files = 'Sources/**/*.swift'
  s.frameworks = 'QuartzCore'

end
