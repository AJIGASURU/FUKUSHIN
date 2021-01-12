//
//  Ball.m
//  PHP
//
//  Created by MacUser on 2021/01/11.
//

//#import <Foundation/Foundation.h>

#import "Ball.h"

@implementation Ball{
  //timer
  //https://qiita.com/masuhara/items/5513eedc4ca0eda656b7
  NSTimer *timer;
}

-(Ball*) init//イニシャライザ
{
    if(self = [super init]){//継承元のイニシャライザを起動->実質的なオーバーライド
      // 画像を表示
    NSLog(@"LOAD BallImage");
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
    CGFloat scale = 0.01f;
    // 画像サイズ変更
    CGRect rect = CGRectMake(0, 0, width*scale, height*scale);
    // ImageView frame をCGRectMakeで作った矩形に合わせる
    _imageView.frame = rect;
    
    //初期化終了。
    }
    return self;
}

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
  CGFloat scale = 0.01f;
  // 画像サイズ変更
  CGRect rect = CGRectMake(0, 0, width*scale, height*scale);
  // ImageView frame をCGRectMakeで作った矩形に合わせる
  _imageView.frame = rect;
  
  //[self setTimer];
  
  //[[self view] addSubview:_imageView];
  return _imageView;//ポインタで返すから運命をともにするはず。
}

-(void)method{
  NSLog(@"method");
}

-(void)setTimer{
  if (!timer) {
          timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(update:) userInfo:nil repeats:YES];
          [timer fire];
      }
}

- (void)update:(NSTimer *)timer {
    _imageView.center = CGPointMake(_imageView.center.x + 1, _imageView.center.y);
  /*
    if (_imageView.center.x > self.view.bounds.size.width) {
        sampleView.center = CGPointMake(0, sampleView.center.y);
    }
   */
}

@end
