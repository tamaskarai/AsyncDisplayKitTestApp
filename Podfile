source 'https://github.com/Skyscanner/Skyscanner.Specs.iOS.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, "8.0"

project "AsyncDisplayKitTestApp.xcodeproj"

target 'AsyncDisplayKitTestApp' do
	pod 'AsyncDisplayKit'
	pod 'PINRemoteImage', '3.0.0-beta.3'

	target 'AsyncDisplayKitTestAppUITests' do
		pod 'OCMock'
	end
  
  	project "AsyncDisplayKitTestApp.xcodeproj"
end