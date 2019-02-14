//
//	LYMainViewController.m
//	LYAppPrivacyRequestGuide
//
//	CREATED BY LUO YU(blodely) ON 2019-02-14.
//	COPYRIGHT © 2019 LUO YU <indie.luo@gmail.com>. ALL RIGHTS RESERVED.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "LYMainViewController.h"
#import <Masonry/Masonry.h>
#import <LYAppPrivacyRequestGuide/LYAppPrivacyRequestGuide.h>


@interface LYMainViewController () {}
@end

@implementation LYMainViewController

// MARK: - ACTION

- (void)showRequestButtonPressed:(id)sender {
	
	LYAppPrivacyReqView *reqv = [LYAppPrivacyReqView view];
	reqv.requestCamera = YES;
	reqv.requestAlbum = YES;
	reqv.requestMIC = YES;
	[reqv show];
}

// MARK: - INIT

- (void)initial {
	[super initial];
}

// MARK: VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	{
		UIButton *view = [UIButton buttonWithType:UIButtonTypeSystem];
		[view setTitle:@"show request guide" forState:UIControlStateNormal];
		[view border1Px];
		[self.view addSubview:view];
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self.view).offset(100);
			make.left.equalTo(self.view).offset(15);
			make.right.equalTo(self.view).offset(-15);
			make.height.mas_equalTo(44);
		}];
		
		[view addTarget:self action:@selector(showRequestButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW.
	
	
}

// MARK: - METHOD

// MARK: PRIVATE METHOD

// MARK:

@end
