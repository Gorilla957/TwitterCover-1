TwitterCover
============

UIScrollview方便添加Path景深效果的category

原作者是：[cyndibaby905](https://github.com/cyndibaby905/TwitterCover)，我把他的模糊效果删掉了，我觉得不好看。

![image](https://raw.githubusercontent.com/jxd001/TwitterCover-1/master/Untitled.gif)

###Step 1，导入
```obj-c
#import "UIScrollView+TwitterCover.h"
```

###Step 2，添加到scrollview上

```obj-c
     UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
    topImage.contentMode = UIViewContentModeScaleAspectFill;
    topImage.layer.masksToBounds = YES;
    
    //网络图片
    NSString *str = @"http://img1.gtimg.com/9/975/97536/9753640_980x1200_292.jpg";
    [self.scrollView addTwitterCoverWithImage:str];
    
    //本地图片
//    topImage.image = [UIImage imageNamed:@"image.jpg"];
//    [self.scrollView addTwitterCoverWithImage:topImage];
    
```


#Good luck

