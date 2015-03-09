//
//  MKCommentView.h
//  YiQiWang
//
//  Created by moyekong on 15/3/9.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MKCommentViewDelegate <NSObject>

- (void)commentWithButtonNumber:(NSInteger)num;
- (void)commentScore:(NSInteger)scoreNum;

@end

@interface MKCommentView : UIView

@property (nonatomic, assign) id<MKCommentViewDelegate>delegate;

@end
