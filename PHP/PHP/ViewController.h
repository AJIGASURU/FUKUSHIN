//
//  ViewController.h
//  PHP
//
//  Created by MacUser on 2020/11/30.
//

//ViewControllerで持ってれば多分問題ない・・・？

#import <UIKit/UIKit.h>
#import "HTTP.h"
#import "Ball.h"

@interface ViewController : UIViewController

//---second view--

@property (weak, nonatomic) IBOutlet UILabel *Label;

//@property (nonatomic) Http_class *http_inst;

- (IBAction)Button:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *Name_Text;
- (IBAction)NameOnReturn:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UITextField *Score_Text;
- (IBAction)ScoreOnReturn:(UITextField *)sender;



//----------initial view---------

- (IBAction)DisplayButton:(UIButton *)sender;

//---いらんそう。----
@property UIImage *image;
@property UIImageView *imageView;

//property->インスタンス変数とアクセサーをまとめて自動生成
@property Ball *ball;//propertyな必要ないかも
@property UIImageView *ballImageView;

@end

