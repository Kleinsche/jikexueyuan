//
//  ViewController.m
//  Task7-3
//
//  Created by 🍋 on 16/8/4.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ScrollView.h"

@interface ScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *preView;
@property (nonatomic, strong) UIImageView *currentView;
@property (nonatomic, strong) UIImageView *nextView;

//@property (nonatomic,assign) NSInteger showTime;
@property (nonatomic, assign) NSInteger showIndex;
@property (nonatomic ,strong) UIPageControl * page;
@property (nonatomic, assign) CGRect pageRect;
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation ScrollView


//-(void)addTimer{
//            self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//}


//懒加载
- (NSTimer *)timer
{
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.showTime target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    }
    return _timer;
}


- (instancetype)initWithFrame:(CGRect)frame WithPageRect:(CGRect)pageRect WithView:(UIView *)superView
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.delegate = self;
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(kWidth * 3, kHeight);
        
        //每次加载三张图片
        _preView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
        _currentView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth, 0, kWidth, kHeight)];
        _nextView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth * 2, 0, kWidth, kHeight)];
        
        [self addSubview:_preView];
        [self addSubview:_currentView];
        [self addSubview:_nextView];
        
        [superView addSubview:self];
        _pageRect = pageRect;
    }
    return self;
}


- (void)reloadView
{
    if (_showIndex <= -1)
    {
        _showIndex = _arrImages.count - 1;
    }
    
    if (_showIndex >= _arrImages.count)
    {
        _showIndex = 0;
    }
    
    NSInteger pre = _showIndex - 1;
    
    if (pre < 0)
    {
        pre = _arrImages.count - 1;
    }
    
    NSInteger next = _showIndex + 1;
    
    if (next >= _arrImages.count)
    {
        next = 0;
    }
    
    _preView.image = _arrImages[pre];
    _currentView.image = _arrImages[_showIndex];
    _nextView.image = _arrImages[next];
    
    _page.currentPage = _showIndex;
    
    [self scrollRectToVisible:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight) animated:NO];
}


- (void)changeScrollView:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > kScreenWidth)
    {
        _showIndex++;
    }
    
    else if (scrollView.contentOffset.x < kScreenWidth)
    {
        _showIndex--;
    }
    
    [self reloadView];
    
}


//拖动时停止计时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
    _timer = nil;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self changeScrollView:scrollView];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}


//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    [self changeScrollView:scrollView];
//    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
//}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self changeScrollView:scrollView];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)setView
{
    [self reloadView];
    //添加计时器
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}


-(void)setPageControl{
    if(!_page)
    {
        _page = [[UIPageControl alloc]initWithFrame:_pageRect];
        _page.numberOfPages = _arrImages.count;
        _page.currentPageIndicatorTintColor = [UIColor cyanColor];
        _page.pageIndicatorTintColor = [UIColor redColor];
        
        [self.superview addSubview:_page];
    }
}

- (void)timerAction
{
    [self setContentOffset:CGPointMake(kScreenWidth * 2, 0) animated:YES];
}

@end
