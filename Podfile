# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'InfinityInstructor' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for InfinityInstructor
	pod 'Firebase/Core'
	pod 'Firebase/Firestore'
	pod 'Firebase/Auth'
	pod ‘FirebaseFirestoreSwift’



  target 'InfinityInstructorTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'InfinityInstructorUITests' do
    # Pods for testing
  end

ost_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.5'
      end
    end
end

end
