# Uncomment the next line to define a global platform for your project
# platform :ios, '10.0'

target 'E-commrce-app' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for E-commrce-app
  pod 'IQDropDownTextField'
  pod 'BEMCheckBox'
  
  
  
  
  target 'E-commrce-app-Admin' do
    # Comment the next line if you don't want to use dynamic frameworks
    
    # Pods for E-commrce-app
    pod 'IQDropDownTextField'
    pod 'BEMCheckBox'
    pod 'YPImagePicker'
    
    
  end
end
post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
end
