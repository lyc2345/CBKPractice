# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'

def common_pods
  pod 'AFNetworking'
  pod 'SDWebImage'
  pod 'YYKit'
  pod 'Masonry'

end

target 'CBKPractice' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for CBKPractice
  common_pods

  target 'CBKPracticeTests' do
    inherit! :search_paths
    
    # common Pods
    common_pods
    
    # Pods for testing
    pod 'Expecta'
    pod 'OCMock'
  end

end
