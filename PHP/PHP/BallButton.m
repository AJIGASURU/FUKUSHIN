//
//  BallButton.m
//  PHP
//
//  Created by MacUser on 2021/01/21.
//

#import "BallButton.h"

@implementation BallButton{
  NSTimer *timer;
  //画像サイズ
  CGFloat width;
  CGFloat height;
  //スクリーンサイズ
  CGFloat screenWidth;
  CGFloat screenHeight;
  //ポジション
  CGFloat posW;
  CGFloat posH;
}

-(BallButton*) init//イニシャライザ
{
    if(self = [super init]){//継承元のイニシャライザを起動->実質的なオーバーライド
      // 画像を表示
    NSLog(@"LOAD BallImage");
    _image = [UIImage imageNamed:@"ball"];
    _button =  [[UIButton alloc] init];
    [_button setBackgroundImage:_image forState:UIControlStateNormal];
    
    //スクリーンのサイズ
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
      NSLog(@"screenWidth = %f", screenWidth);
      NSLog(@"screenWidth = %f", screenHeight);

    // 画像の幅
    width = _image.size.width;
    // 画像の高さ
    height = _image.size.height;
    //拡大率
      _scale = 0.01f;
    // 画像サイズ変更
      posW = screenWidth/3;
      posH = screenHeight/3;
    CGRect rect = CGRectMake(posW, posH, width*_scale, height*_scale);
    // ImageView frame をCGRectMakeで作った矩形に合わせる
    _button.frame = rect;
    
    //ボタン押下時の設定。
    [_button addTarget:self action:@selector(button_select:) forControlEvents:UIControlEventTouchUpInside];
    
    //まだたっちされてないよ状態
      _touched = false;
    //初期化終了。
    }
    return self;
}

-(void)expantion:(CGFloat)coef{//拡大する関数。
  _scale = _scale * coef;
  CGRect rect = CGRectMake(posW, posH, width*_scale, height*_scale);
  _button.frame = rect;
}


-(void)setTimer{
  if (!timer) {
          timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(update:) userInfo:nil repeats:YES];
          [timer fire];
      }
}

- (void)update:(NSTimer *)timer {
    _button.center = CGPointMake(_button.center.x + 1, _button.center.y);
}

//ボタン押下時の振る舞い
-(void)button_select:(UIButton *)button {
  _touched = true;
}

-(void)reset{
//位置とか初期化
  _scale = 0.01f;
  posW = (float)(arc4random_uniform(screenWidth-50));
  posH = (float)(arc4random_uniform(screenHeight-50));
  CGRect rect = CGRectMake(posW, posH, width*_scale, height*_scale);
  _button.frame = rect;
  _touched = false;
}

@end
