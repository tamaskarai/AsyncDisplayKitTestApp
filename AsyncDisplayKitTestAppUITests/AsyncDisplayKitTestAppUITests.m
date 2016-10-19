//
//  AsyncDisplayKitTestAppUITests.m
//  AsyncDisplayKitTestAppUITests
//
//  Created by Tamas Karai on 19/10/16.
//  Copyright © 2016 Skyscanner Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <AsyncDisplayKit/ASButtonNode.h>

@interface AsyncDisplayKitTestAppUITests : XCTestCase
{
    id _selfMock;
}

@end

@implementation AsyncDisplayKitTestAppUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    
    _selfMock = OCMPartialMock(self);
}

- (void)testUIKitOrder
{
    // Given
    UIButton *button = [UIButton new];
    [button addTarget:self action:@selector(firstAction) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(secondAction) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(thirdAction) forControlEvents:UIControlEventTouchUpInside];

    [_selfMock setExpectationOrderMatters:YES];
    OCMExpect([_selfMock firstAction]);
    OCMExpect([_selfMock secondAction]);
    OCMExpect([_selfMock thirdAction]);
    
    // When
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    // Then
    OCMVerifyAll(_selfMock);
}

- (void)testAsyncDisplayKitOrder
{
    // Given
    ASButtonNode *button = [ASButtonNode new];
    [button addTarget:self action:@selector(firstAction) forControlEvents:ASControlNodeEventTouchUpInside];
    [button addTarget:self action:@selector(secondAction) forControlEvents:ASControlNodeEventTouchUpInside];
    [button addTarget:self action:@selector(thirdAction) forControlEvents:ASControlNodeEventTouchUpInside];
    
    [_selfMock setExpectationOrderMatters:YES];
    OCMExpect([_selfMock firstAction]);
    OCMExpect([_selfMock secondAction]);
    OCMExpect([_selfMock thirdAction]);
    
    // When
    [button sendActionsForControlEvents:ASControlNodeEventTouchUpInside withEvent:nil];
    
    // Then
    OCMVerifyAll(_selfMock);
}

- (void)firstAction
{
    
}

- (void)secondAction
{
    
}

- (void)thirdAction
{
    
}

@end
