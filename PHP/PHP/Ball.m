//
//  Ball.m
//  PHP
//
//  Created by MacUser on 2021/01/11.
//

//#import <Foundation/Foundation.h>

#import "Ball.h"

@implementation Ball

- (UIImageView *)display{ //_imageViewはポインタ型
    // 画像を表示
  NSLog(@"image load");
    _image = [UIImage imageNamed:@"ball"];
    _imageView = [[UIImageView alloc]initWithImage:_image];
  
  //場所
  CGFloat pWidth = [UIScreen mainScreen].bounds.size.width;
  CGFloat pHeight = [UIScreen mainScreen].bounds.size.height;
  [_imageView setCenter:CGPointMake(pWidth/2, pHeight/2)];
  
  // 画像の幅
  CGFloat width = _image.size.width;
  // 画像の高さ
  CGFloat height = _image.size.height;
  //拡大率
  CGFloat scale = 0.1f;
  // 画像サイズ変更
  CGRect rect = CGRectMake(0, 0, width*scale, height*scale);
  // ImageView frame をCGRectMakeで作った矩形に合わせる
  _imageView.frame = rect;
  
  //[[self view] addSubview:_imageView];
  return _imageView;
}

-(void)method{
  NSLog(@"method");
}

@end
