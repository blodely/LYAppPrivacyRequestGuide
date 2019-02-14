#
# Be sure to run `pod lib lint LYAppPrivacyRequestGuide.podspec' to ensure this
# Created by Luo Yu(indie.luo@gmail.com).
# Thursday, February 14, 2019
#

Pod::Spec.new do |s|
	s.name             = 'LYAppPrivacyRequestGuide'
	s.version          = '1.0.0'
	s.summary          = 'LYAppPrivacyRequestGuide.'

	s.description      = <<-DESC
App Privacy Request Guide Views.
Better UX for requesting auths.
                       DESC

	s.homepage         = 'https://github.com/blodely/LYAppPrivacyRequestGuide'

	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'Luo Yu(blodely)' => 'indie.luo@gmail.com' }
	s.source           = { :git => 'https://github.com/blodely/LYAppPrivacyRequestGuide.git', :tag => s.version.to_s }
	s.social_media_url = 'https://weibo.com/blodely'

	s.ios.deployment_target = '9.0'

	s.source_files = 'LYAppPrivacyRequestGuide/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYAppPrivacyRequestGuide' => ['LYAppPrivacyRequestGuide/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
	s.frameworks = 'UIKit'
	
	s.dependency 'LYCategory'
	s.dependency 'Masonry'

end
