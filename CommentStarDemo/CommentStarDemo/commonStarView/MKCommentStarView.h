//
//  MKCommentStarView.h
//  YiQiWang
//
//  Created by moyekong on 15/3/9.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MKCommentStarViewDelegate <NSObject>

- (void)starNumberBeenClicked:(NSInteger)btnNum;

@end

@interface MKCommentStarView : UIView

@property (nonatomic, assign) id<MKCommentStarViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIButton *firstStarButton;
@property (weak, nonatomic) IBOutlet UIButton *secondStarButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdStarButton;
@property (weak, nonatomic) IBOutlet UIButton *fourthStarButton;
@property (weak, nonatomic) IBOutlet UIButton *fifthStarButton;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end
