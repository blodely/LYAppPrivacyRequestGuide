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
#import <LYCategory/LYCategory.h>
#import "APRPermissionButton.h"


@interface LYAppPrivacyReqView () {
	
	__weak APRPermissionButton *cCamera;
	__weak APRPermissionButton *cAlbum;
	__weak APRPermissionButton *cMIC;
	__weak APRPermissionButton *cLocating;
}
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
	self.tintColor = [UIColor colorWithHex:@"#434c83" andAlpha:1.0];
	
	{
		// MARK: CONTAINER
		UIView *view = [[UIView alloc] init];
		view.backgroundColor = [UIColor whiteColor];
		[self addSubview:view];
		vCont = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self);
		}];
	}
	
	{
		// MARK: SKIP BUTTON
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
		APRPermissionButton *view = [[APRPermissionButton alloc] init];
		[vCont addSubview:view];
		cCamera = view;
		
		cCamera.lblHint.text = @"Camera permission.";
	}
	
	{
		APRPermissionButton *view = [[APRPermissionButton alloc] init];
		[vCont addSubview:view];
		cAlbum = view;
		
		cAlbum.lblHint.text = @"Album permission.";
	}
	
	{
		APRPermissionButton *view = [[APRPermissionButton alloc] init];
		[vCont addSubview:view];
		cMIC = view;
		
		cMIC.lblHint.text = @"Microphone permission.";
	}
	
	{
		APRPermissionButton *view = [[APRPermissionButton alloc] init];
		[vCont addSubview:view];
		cLocating = view;
		
		cLocating.lblHint.text = @"Location permission.";
	}
}

// MARK: - METHOD

- (void)show {
	
	[self reorderButtons];
	
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

// MARK: PRIVATE METHOD

- (void)reorderButtons {
	CGFloat padding = 15.0f;
	CGFloat height = 50.0f;
	
	[cCamera mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self).offset(HEIGHT * 0.25);
		make.left.equalTo(self).offset(padding);
		make.right.equalTo(self).offset(-padding);
		if (self->_requestCamera) {
			make.height.mas_equalTo(height);
		} else {
			make.height.mas_equalTo(0);
		}
	}];
	[cAlbum mas_makeConstraints:^(MASConstraintMaker *make) {
		make.leading.trailing.equalTo(self->cCamera);
		if (self->_requestCamera) {
			make.top.equalTo(self->cCamera.mas_bottom).offset(padding);
		} else {
			make.top.equalTo(self->cCamera.mas_bottom).offset(0);
		}
		if (self->_requestAlbum) {
			make.height.mas_equalTo(height);
		} else {
			make.height.mas_equalTo(0);
		}
	}];
	[cMIC mas_makeConstraints:^(MASConstraintMaker *make) {
		if (self->_requestAlbum) {
			make.top.equalTo(self->cAlbum).offset(padding);
		} else {
			make.top.equalTo(self->cAlbum).offset(0);
		}
	}];
}

// MARK: - OVERWRITE

- (void)setTintColor:(UIColor *)tintColor {
	[super setTintColor:tintColor];
}

@end
