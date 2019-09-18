# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# Pods for MVVMBase

def networking
  pod 'Alamofire'
  pod 'SDWebImage', :modular_headers => true
end

def dababase
  pod 'RealmSwift', :modular_headers => true
  pod 'Realm', :modular_headers => true
end

def push
  pod 'Firebase/Analytics'
  pod 'Firebase/Messaging'
end

target 'MVVMBase' do
  networking
  dababase
  push
end
