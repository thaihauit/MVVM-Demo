# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def networking
  pod 'Moya/RxSwift'
end

def structure
  pod 'RxRealm'
  pod 'RxCocoa'
  
end

def di
  pod 'Swinject'
  pod 'SwinjectStoryboard'
end


target 'MVVM-Moya' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  networking
  structure
  # Pods for MVVM-Moya

  target 'MVVM-MoyaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MVVM-MoyaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
