//
//  ViewController.m
//  PHP
//
//  Created by MacUser on 2020/11/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
  NSTimer *timer;
  bool isPlaying;
  int score;
  NSString *scoreString;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTimer];
  _nextButton.hidden = YES;
  _gameOverLabel.hidden = YES;
  _nameText.hidden = YES;
  _sendButton.hidden = YES;
  isPlaying = false;
  score = 0;
  NSLog(@"http_instance = %@", _http_instance);
  if(_http_instance == NULL){
  _http_instance = [[Http_class alloc]init];
    NSLog(@"made http instance");
  }
  _rankLabel.numberOfLines = 0;//ラベルが複数行にできる魔法
}

- (IBAction)startButtonAction:(UIButton *)sender {
  //スタートボタン押下時
  isPlaying = true;
  scoreString = @"SCORE:0";
  score = 0;
  _scoreLabel.text =  scoreString;
  _startButton.hidden = YES;
  _rankButton.hidden = YES;
  _rankLabel.hidden = YES;
  _ball = [[BallButton alloc] init];//毎回インスタンスつくる羽目に。
  [[self view] addSubview:_ball.button];
}

- (IBAction)NameOnReturn:(UITextField *)sender {
  [sender resignFirstResponder];
}

- (IBAction)ScoreOnReturn:(UITextField *)sender {
  //多分使わない
  [sender resignFirstResponder];
}

-(void)setTimer{//ゲームスタートでタイマー開始でも良いが、停止方法がわからん。
  if (!timer) {
          timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(update:) userInfo:nil repeats:YES];
          [timer fire];
      }
}

- (void)update:(NSTimer *)timer {//update
  if(_ball.touched == true){//キャッチ
    //NSLog(@"得点加算処理");
    score = score + 1;
    scoreString =  [NSString stringWithFormat:@"SCORE:%d", score];
    _scoreLabel.text =  scoreString;
    [_ball reset];//わざわざここでやんなくても良いが。
  }
  if(_ball.scale > 0.08 && isPlaying == true){//ゲームオーバー（1度だけ通る。）
    //NSLog(@"GameOver");
    _ball.button.hidden = YES;
    _nextButton.hidden =  NO;
    _gameOverLabel.hidden = NO;
    _nameText.hidden =  NO;
    _sendButton.hidden = NO;
    _rankLabel.hidden = NO;
    isPlaying = false;
  }else if(isPlaying == true){//プレー中
    [_ball expantion:1.01f];
  }

}

- (IBAction)nextButtonAction:(UIButton *)sender {
  //'タイトルへ'ボタン押下時
  _startButton.hidden = NO;
  _rankButton.hidden = NO;
  _nextButton.hidden = YES;
  _gameOverLabel.hidden = YES;
  _nameText.hidden = YES;
  _sendButton.hidden = YES;
}
- (IBAction)sendButtonAction:(UIButton *)sender {
  //送信ボタン押下後
  //------------HTTP--------------------
  
  NSString *Name_String = [_nameText text];
  NSString *Score_String = [NSString stringWithFormat:@"%d", score];
  
  if([Name_String length] == 0){
    NSLog(@"NAME Empty!");
  }else{
    NSLog(@"PASS");
    bool success = false;//もはや何の意味もない。
    [_http_instance http_request_insert:Name_String score:Score_String success:&success];
    if(success == false){
      NSLog(@"通信失敗・・・というわけではない。処理中なだけ");
    }else{
      NSLog(@"通信成功");
    }
  }
}

//ランキング表示ソート用メソッド。
NSInteger sortArray(NSDictionary* dic1, NSDictionary* dic2, void *context) {
  int number1 = [[dic1 objectForKey:@"score"] intValue];
  int number2 = [[dic2 objectForKey:@"score"] intValue];
  if(number1 > number2){
    return NSOrderedAscending;
  }else{
    return NSOrderedDescending;
  }
}

-(void)ranking{//ランキング表示
  //NSLog(@"jsonData: %@", _http_instance.jsonData);
  
  NSArray *sortedArray = [_http_instance.jsonData sortedArrayUsingFunction:sortArray context:nil];
  //NSLog(@"%@", sortedArray);
  NSMutableString *strRanking = [[NSMutableString alloc] initWithString:@"＜順位＞\n"];
  for(int i=0;i < 10;i++){
    [strRanking appendString:[NSString stringWithFormat:@"%d位: [%@:%@]\n", i+1, [sortedArray[i] objectForKey:@"name"], [sortedArray[i] objectForKey:@"score"]]];
  }

  _rankLabel.text = strRanking;
  NSLog(@"strRanking:%@", strRanking);
}
- (IBAction)rankButtonAction:(UIButton *)sender {
  NSLog(@"ランキングを表示します");
  bool *success = false;//実は要らない。
  //セレクトのみ（phpファイル分けない方が良いかも）
  [_http_instance http_request_select:success];
  if(_http_instance.jsonData != NULL){
  [self ranking];
  }else{
    NSLog(@"jsonDataがNULL状態です。しばらく経ってからまた押してください的なことを表示しましょう");
  }
}

@end
