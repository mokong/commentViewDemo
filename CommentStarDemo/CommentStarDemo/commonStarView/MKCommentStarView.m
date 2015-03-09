//
//  MKCommentStarView.m
//  YiQiWang
//
//  Created by moyekong on 15/3/9.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "MKCommentStarView.h"

@implementation MKCommentStarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"MKCommentStarView" owner:self options:nil] lastObject];
    self.frame = frame;
    if (self) {
        
        [self _setButtonTagAndImageWithButton:self.firstStarButton tagNumber:10420309 + 0];
        [self _setButtonTagAndImageWithButton:self.secondStarButton tagNumber:10420309 + 1];
        [self _setButtonTagAndImageWithButton:self.thirdStarButton tagNumber:10420309 + 2];
        [self _setButtonTagAndImageWithButton:self.fourthStarButton tagNumber:10420309 + 3];
        [self _setButtonTagAndImageWithButton:self.fifthStarButton tagNumber:10420309 + 4];
        
        self.commentLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:178.0/255.0 blue:0.0 alpha:1.0];
    }
    return self;
}

- (void)_setButtonTagAndImageWithButton:(UIButton *)targetButton tagNumber:(NSInteger)btnTag {
    [targetButton setBackgroundImage:[UIImage imageNamed:@"xing_hui50"] forState:UIControlStateNormal];
    targetButton.tag = btnTag;
    [targetButton addTarget:self action:@selector(handleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleButtonClicked:(UIButton *)clickedButton {
    NSInteger btnTag = clickedButton.tag - 10420309;
    for (id targetSubview in self.subviews) {
        if ([targetSubview isKindOfClass:[UIButton class]]) {
            UIButton * tempButton = (UIButton *)targetSubview;
            if (tempButton.tag <= clickedButton.tag) {
                [tempButton setBackgroundImage:[UIImage imageNamed:@"xing_50"] forState:UIControlStateNormal];
            } else {
                [tempButton setBackgroundImage:[UIImage imageNamed:@"xing_hui50"] forState:UIControlStateNormal];
            }
        }
    }
    switch (btnTag) {
        case 0:
        {
            self.commentLabel.text = @"讨厌";
        }
            break;
        case 1:
        {
            self.commentLabel.text = @"不喜欢";
        }
            break;
        case 2:
        {
            self.commentLabel.text = @"还行";
        }
            break;
        case 3:
        {
            self.commentLabel.text = @"喜欢";
        }
            break;
        case 4:
        {
            self.commentLabel.text = @"超喜欢";
        }
            break;
            
        default:
            break;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(starNumberBeenClicked:)]) {
        [self.delegate starNumberBeenClicked:btnTag];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
