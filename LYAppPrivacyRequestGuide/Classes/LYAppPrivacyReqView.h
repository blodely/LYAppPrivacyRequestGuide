//
//	LYAppPrivacyReqView.h
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

#import <UIKit/UIKit.h>


@interface LYAppPrivacyReqView : UIView {
	
	__weak UIView *vCont;
	__weak UIButton *btnSkip;
}

@property (nonatomic, assign) BOOL requestCamera;
@property (nonatomic, assign) BOOL requestAlbum;
@property (nonatomic, assign) BOOL requestMIC;
@property (nonatomic, assign) BOOL requestLocating;

+ (instancetype)view;

- (void)show;

- (void)dismiss;

@end
