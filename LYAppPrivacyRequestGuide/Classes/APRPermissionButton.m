//
//	APRPermissionButton.m
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

#import "APRPermissionButton.h"
#import <Masonry/Masonry.h>
#import <LYCategory/LYCategory.h>


@interface APRPermissionButton () {
	
	__weak UIView *vBorder;
}
@end

@implementation APRPermissionButton

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self initial];
	}
	return self;
}

- (void)initial {
	
	_status = APRPermissionButtonStatusNormal;
	
	{
		UIView *view = [[UIView alloc] init];
		view.backgroundColor = [UIColor clearColor];
		view.userInteractionEnabled = NO;
		[self addSubview:view];
		vBorder = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self);
		}];
	}
	
	{
		UIImageView *view = [[UIImageView alloc] init];
		[self addSubview:view];
		_ivIcon = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(self).offset(15);
			make.centerY.equalTo(self);
			make.width.height.mas_equalTo(22);
		}];
	}
	
	{
		UILabel *view = [[UILabel alloc] init];
		view.font = [UIFont systemFontOfSize:14];
		[self addSubview:view];
		_lblHint = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.leading.equalTo(self->_ivIcon.mas_trailing).offset(15);
			make.top.equalTo(self).offset(4);
			make.bottom.equalTo(self).offset(-4);
			make.right.equalTo(self).offset(-4);
		}];
	}
}

- (void)setStatus:(APRPermissionButtonStatus)status {
	_status = status;
	
	switch (_status) {
		default:
		case APRPermissionButtonStatusNormal: {
			[vBorder removeBorder];
		} break;
		case APRPermissionButtonStatusAuth: {
			[vBorder borderWithWidth:2 andColor:[UIColor greenColor]];
		} break;
		case APRPermissionButtonStatusDeny: {
			[vBorder borderWithWidth:2 andColor:[UIColor redColor]];
		} break;
	}
}

@end
