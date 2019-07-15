# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'movieDBapp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for movieDBapp

	pod 'Alamofire' , '4.8.2'
	pod 'RealmSwift' , '3.17.1'
  pod 'IQKeyboardManagerSwift', '6.2.0'
  pod 'YoutubePlayerView'

  
  #compile youtube pod with swift 4.2 , 5 is not supported
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if ['YoutubePlayerView'].include? target.name
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.2'
        end
      end
    end
  end
  
end
