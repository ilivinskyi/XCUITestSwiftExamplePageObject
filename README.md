# XCUITestSwiftExamplePageObject 
A simple example of XCUITest Page Object for simple SwiftUI test application

### Installation
Clone or download repository 

    git clone https://github.com/ilivinskyi/XCUITestSwiftExamplePageObject.git
	
switch to cloned folder 

	cd XCUITestSwiftExamplePageObject/SampleAppForXCUITest

run tests

	xcodebuild test -scheme SampleAppForXCUITestUITests -destination "platform=iOS Simulator,name=iPhone 12 Pro Max" -testPlan AllTests -resultBundlePath result.xcresult
  
Tests can also be executed in several stream to speed things up

  ```xcodebuild test -scheme SampleAppForXCUITestUITests -destination "platform=iOS Simulator,name=iPhone 12 Pro Max" -testPlan AllTests -disable-concurrent-destination-testing -parallel-testing-enabled YES -parallel-testing-worker-count 2 -resultBundlePath /Users/ihorl/Desktop/result.xcresult```
