//
//  MKCommentView.m
//  YiQiWang
//
//  Created by moyekong on 15/3/9.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "MKCommentView.h"
#import "MKCommentStarView.h"

@interface MKCommentView ()<MKCommentStarViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *closeBackView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIView *starBackView;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *feedBackButton;
@property (weak, nonatomic) IBOutlet MKCommentView *backView;

@property (nonatomic, strong) MKCommentStarView * commentStarView;
@property (nonatomic, strong) UILabel * seperatorLabel;
@property (nonatomic, strong) UIView * alphaView;

@end

@implementation MKCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"MKCommentView" owner:self options:nil] lastObject];
    self.backgroundColor = [UIColor clearColor];
    self.frame = frame;
    if (self) {
        
        self.alphaView = [[UIView alloc] initWithFrame:self.bounds];
        self.alphaView.userInteractionEnabled = YES;
        self.alphaView.backgroundColor = [UIColor blackColor];
        self.alphaView.alpha = 0.65;
        [self addSubview:self.alphaView];
        [self insertSubview:self.alphaView belowSubview:self.backView];
        
        self.backView.backgroundColor = [UIColor whiteColor];
        [self.closeButton setBackgroundImage:[UIImage imageNamed:@"guanbi_31"] forState:UIControlStateNormal];
        [self.closeButton addTarget:self action:@selector(handleCloseClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer * tapOnClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleCloseClicked:)];
        [self.closeBackView addGestureRecognizer:tapOnClose];
        
        self.commentStarView = [[MKCommentStarView alloc] initWithFrame:self.starBackView.bounds];
        self.commentStarView.delegate = self;
        self.starBackView.userInteractionEnabled = YES;
        [self.starBackView addSubview:self.commentStarView];
        
        CGFloat seperatorY = self.starBackView.frame.origin.y + self.starBackView.frame.size.height - 6.0;
        CGFloat seperatorX = 15.0;
        self.seperatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(seperatorX, seperatorY, 280.0 - seperatorX * 2.0, 0.5)];
        self.seperatorLabel.backgroundColor = [UIColor lightGrayColor];
        [self.backView addSubview:self.seperatorLabel];
        
        [self.feedBackButton addTarget:self action:@selector(handleFeedBackClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.feedBackButton setTitleColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [self.commentButton addTarget:self action:@selector(handleCommentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}

- (void)handleCloseClicked:(id)sender
{
    // 0-关闭, 1-反馈，2——评论
    if (self.delegate && [self.delegate respondsToSelector:@selector(commentWithButtonNumber:)]) {
        [self.delegate commentWithButtonNumber:0];
    }
}

- (void)handleFeedBackClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(commentWithButtonNumber:)]) {
        [self.delegate commentWithButtonNumber:1];
    }
}

- (void)handleCommentButtonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(commentWithButtonNumber:)]) {
        [self.delegate commentWithButtonNumber:2];
    }
}

- (void)starNumberBeenClicked:(NSInteger)btnNum
{
    if (btnNum < 2) {
        [self.commentButton setTitleColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.feedBackButton setTitleColor:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    } else if (btnNum >= 2 && btnNum < 5) {
        [self.commentButton setTitleColor:[UIColor colorWithRed:0/255.0 green:128.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.feedBackButton setTitleColor:[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(commentScore:)]) {
        [self.delegate commentScore:btnNum];
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
