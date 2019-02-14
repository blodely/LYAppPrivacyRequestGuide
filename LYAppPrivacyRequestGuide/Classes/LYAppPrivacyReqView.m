//
//	LYAppPrivacyReqView.m
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

#import "LYAppPrivacyReqView.h"
#import <Masonry/Masonry.h>
#import "APRPermissionButton.h"


@interface LYAppPrivacyReqView () {}
@end

@implementation LYAppPrivacyReqView

// MARK: - ACTION

- (void)skipButtonPressed:(id)sender {
	[self dismiss];
}

// MARK: - INIT

+ (instancetype)view {
	return [[LYAppPrivacyReqView alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
	frame = [UIScreen mainScreen].bounds;
	if (self = [super initWithFrame:frame]) {
		[self initial];
	}
	return self;
}

- (instancetype)init {
	if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
		[self initial];
	}
	return self;
}

- (void)initial {
	
	self.hidden = YES;
	self.backgroundColor = [UIColor clearColor];
	
	{
		UIView *view = [[UIView alloc] init];
		view.backgroundColor = [UIColor whiteColor];
		[self addSubview:view];
		vCont = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self);
		}];
	}
	
	{
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		[vCont addSubview:button];
		btnSkip = button;
		
		[button setTitle:@"Skip" forState:UIControlStateNormal];
		[button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
		button.titleLabel.font = [UIFont systemFontOfSize:14];
		
		[button mas_makeConstraints:^(MASConstraintMaker *make) {
			if (@available(iOS 11.0, *)) {
				make.top.equalTo(self.mas_safeAreaLayoutGuideTop).offset(6);
			} else {
				make.top.equalTo(self).offset(6);
			}
			make.right.equalTo(self).offset(-15);
		}];
		
		[btnSkip addTarget:self action:@selector(skipButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	{
		
	}
}

// MARK: -

- (void)show {
	
	if ([self superview] != nil) {
		self.hidden = NO;
		return;
	}
	
	[[UIApplication sharedApplication].keyWindow addSubview:self];
	self.hidden = NO;
	
}

- (void)dismiss {
	[UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
		self.alpha = 0;
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

@end
