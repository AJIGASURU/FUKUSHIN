//
//  ViewController.h
//  PHP
//
//  Created by MacUser on 2020/11/30.
//

//ViewControllerで持ってれば多分問題ない・・・？

#import <UIKit/UIKit.h>
#import "HTTP.h"
#import "BallButton.h"

@interface ViewController : UIViewController

//---second view--
//HTTP Button
//- (IBAction)Button:(UIButton *)sender;
//-----------------------
//@property (weak, nonatomic) IBOutlet UILabel *Label;

//@property (weak, nonatomic) IBOutlet UITextField *Name_Text;
- (IBAction)NameOnReturn:(UITextField *)sender;

//@property (weak, nonatomic) IBOutlet UITextField *Score_Text;
- (IBAction)ScoreOnReturn:(UITextField *)sender;

//----------initial view---------
//スタートボタン
@property (weak, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)startButtonAction:(UIButton *)sender;

//ランキングボタン（ボツ（2枚目に行ったやつ。））
//@property (weak, nonatomic) IBOutlet UIButton *rankButton;
//ランキング表示ボタン
@property (weak, nonatomic) IBOutlet UIButton *rankButton;
- (IBAction)rankButtonAction:(UIButton *)sender;
//ランキング表示ラベル
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

//タイトルへボタン
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)nextButtonAction:(UIButton *)sender;
//ゲームオーバーラベル
@property (weak, nonatomic) IBOutlet UILabel *gameOverLabel;
//スコアラベル
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//名前入力
@property (weak, nonatomic) IBOutlet UITextField *nameText;
//送信ボタン
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)sendButtonAction:(UIButton *)sender;

//property->インスタンス変数とアクセサーをまとめて自動生成
@property (nonatomic) BallButton *ball;
@property (nonatomic) Http_class *http_instance;
@end

