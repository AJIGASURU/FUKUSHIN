//
//  ViewController.m
//  PHP
//
//  Created by MacUser on 2020/11/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  //[self displayImage];
}


- (IBAction)Button:(UIButton *)sender {
  
  //------------HTTP--------------------
  NSLog(@"TANAKA!");
  //_Label.text = @"TANAKA!";
  
  NSString *Name_String = [_Name_Text text];
  NSString *Score_String = [_Score_Text text];
  
  NSString *Str_for_Label = [NSString stringWithFormat:@"%@ & %@",Name_String, Score_String];
  _Label.text = Str_for_Label;
  NSLog(@"%@", Str_for_Label);
  
  if([Name_String length] == 0 || [Score_String length] == 0){
    NSLog(@"Empty!");
  }else{
    NSLog(@"PASS");
    /*
    Http_class *http_instance = [[Http_class alloc]init];
    [http_instance http_request_insert:Name_String score:Score_String];
     */
  }
  
  
  //----------------DISPLAY-IMAGE-TEST--------------------
  
}

/*
- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    NSLog(@"return");
    // キーボードを閉じる
    [sender resignFirstResponder];
 
    return TRUE;
}
 */
- (IBAction)NameOnReturn:(UITextField *)sender {
  [sender resignFirstResponder];
}

- (IBAction)DisplayButton:(UIButton *)sender {
  NSLog(@"DISP");
  //UIImageView *ball_view = [_ball display];
  _ball = [[Ball alloc] init];//知らんけど初期化要るっぽい。
  //[_ball method];
  _imageView = [_ball display];
  [[self view] addSubview:_imageView];
}

- (IBAction)ScoreOnReturn:(UITextField *)sender {
  [sender resignFirstResponder];
}



- (void)displayImage{
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
  
  [[self view] addSubview:_imageView];
}




@end
