//
//  UIScrollView+TwitterCover.m
//  TwitterCover
//
//  Created by hangchen on 1/7/14.
//  Copyright (c) 2014 Hang Chen (https://github.com/cyndibaby905)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "UIScrollView+TwitterCover.h"
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>


static char UIScrollViewTwitterCover;

@implementation UIScrollView (TwitterCover)

- (void)setTwitterCoverView:(CHTwitterCoverView *)twitterCoverView {
    [self willChangeValueForKey:@"twitterCoverView"];
    objc_setAssociatedObject(self, &UIScrollViewTwitterCover,
                             twitterCoverView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"twitterCoverView"];
}

- (CHTwitterCoverView *)twitterCoverView {
    return objc_getAssociatedObject(self, &UIScrollViewTwitterCover);
}




- (void)addTwitterCoverWithImage:(id)image
{
    CHTwitterCoverView *view = [[CHTwitterCoverView alloc] initWithFrame:CGRectMake(0,0, 320, CHTwitterCoverViewHeight)];
    
    if ([image isKindOfClass:[UIImage class]]||[image isKindOfClass:[NSString class]]) {
        
        view.backgroundColor = [UIColor clearColor];
        view.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, CHTwitterCoverViewHeight)];
        view.imageView.contentMode = UIViewContentModeScaleAspectFill;
        view.imageView.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [view addSubview:view.imageView];
        
        
        if ([image isKindOfClass:[UIImage class]]) {
            view.imageView.image = image;
        }
        else if ([image isKindOfClass:[NSString class]]){
            [view.imageView setImageWithURL:[NSURL URLWithString:image]];
        }
        
        
    }
    else{
        [view addSubview:image];
        view.backgroundColor = [UIColor clearColor];
        ((UIView*)image).autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

    }
    
    view.scrollView = self;
    
    [self addSubview:view];
    self.twitterCoverView = view;
}


@end


@implementation CHTwitterCoverView
{
    NSMutableArray *blurImages_;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;

    }
    return self;
}


- (void)setScrollView:(UIScrollView *)scrollView
{
    
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.scrollView.contentOffset.y < 0) {
        CGFloat offset = -self.scrollView.contentOffset.y;
        self.frame = CGRectMake(0,-offset, 320, CHTwitterCoverViewHeight + offset);
    }
    else {
        self.frame = CGRectMake(0,0, 320, CHTwitterCoverViewHeight);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsLayout];
}

@end

