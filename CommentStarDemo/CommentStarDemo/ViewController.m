//
//  ViewController.m
//  CommentStarDemo
//
//  Created by moyekong on 15/3/9.
//  Copyright (c) 2015年 MK. All rights reserved.
//

#import "ViewController.h"
#import "MKCommentView.h"

@interface ViewController ()<MKCommentViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showCommentViewButton;

@property (nonatomic, strong) MKCommentView * commentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)clickedShowButton:(id)sender {
    
    self.commentView = [[MKCommentView alloc] initWithFrame:self.view.bounds];
    self.commentView.delegate = self;
    [self.view.window addSubview:self.commentView];
}

#pragma mark - commentView delegate - 
- (void)commentScore:(NSInteger)scoreNum
{
    // 打分，星星个数
    NSLog(@"%ld分", (long)scoreNum + 1);
    
}

- (void)commentWithButtonNumber:(NSInteger)num
{
    [self.commentView removeFromSuperview];
    switch (num) {
        case 0:
        {
            NSLog(@"关闭");
        }
            break;
        case 1:
        {
            NSLog(@"反馈问题");
        }
            break;
        case 2:
        {
            NSLog(@"撰写评论");
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
