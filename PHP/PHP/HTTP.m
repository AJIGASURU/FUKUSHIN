//
//  HTTP.m
//  PHP
//
//  Created by MacUser on 2020/12/11.
//

#import "HTTP.h"

@implementation Http_class

- (void)http_request_insert:(NSString*)name score:(NSString*)score success:(bool*)success{
  //__block NSArray *json_data_;
  __block bool *success_pointer = success;
  
  NSString *url = @"http://192.168.111.104/test02.php";
  NSString *postString;
  NSMutableURLRequest *request;

  // POSTパラメーターを設定、間は&
  //NSString *param = @"com_ment=kita";
  NSString *param = [NSString stringWithFormat:@"name=%@&score=%@",name, score];
  postString = [NSString stringWithFormat:@"%@", param];

  // リクエスト設定
  request = [[NSMutableURLRequest alloc] init];
  // 多分こっちから送るのがポスト
  [request setHTTPMethod:@"POST"];
  [request setURL:[NSURL URLWithString:url]];
  [request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
  [request setTimeoutInterval:20];
  [request setHTTPShouldHandleCookies:FALSE];
  //これがポストデータ
  [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
  //ephemeralだとメモリ使用量の制限があるらしい。よくわからんが。
  //NSURLSessionが破棄されたタイミングで全てのデータを削除。
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          // _Nullable -> nilを許容。
          // connectionError -> error
    NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
    
          if (error) {
              NSLog(@"Error\n");
              //[[NSNotificationCenter defaultCenter] postNotificationName:@"LoadDataFailed" object:nil];
              return;
          }
    if (statusCode != 200) {
              NSLog(@"200 Error\n");
              NSLog(@"response status code: %ld", (long)statusCode);
              //[[NSNotificationCenter defaultCenter] postNotificationName:@"LoadDataFailed" object:nil];
              return;
          }
         //dataはjsonで受け取ろう！
         //[[NSNotificationCenter defaultCenter] postNotificationName:@"LoadDataSuccess" object:data];
          NSLog(@"Success\n");
          //NSString *data_string = [[NSString alloc] initWithData:data
                                                //encoding:NSUTF8StringEncoding];
          //NSLog(@"%@", data_string);
          NSArray *json_data = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
          self->_jsonData = json_data;
    //NSLog(@"NAME：%@　SCORE：%@", [self->_jsonData valueForKeyPath:@"name"], [self->_jsonData valueForKeyPath:@"score"]);
    //NSLog(@"%@", self->_jsonData);
          *success_pointer = true;
      }];
      [task resume];//タスクを再開？裏で実行されるっぽい。
  return;
  /*
  //同期通信で送信
  NSURLResponse *response = nil;
  NSError *error = nil;
  NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  if (error != nil) {
      NSLog(@"Error!");
      return;
  }
  NSError *e = nil;
  //取得したレスポンスをJSONパース
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:nil error:&e];
  NSString *token = [dict objectForKey:@"token"];
  NSLog(@"Token is %@", token);
   */
  
  /*
  // 送信
  NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  if (connection) {
    //表示しろ。
    NSLog(@"接続成功");
    //[NSMutableData data];
  }*/
}

- (void)http_request_select:(bool*)success{
  //__block bool *success_pointer = success;
  
  NSString *url = @"http://192.168.111.104/test03.php";
  
  NSMutableURLRequest *request;
  // リクエスト設定
  request = [[NSMutableURLRequest alloc] init];
  // ゲット
  [request setHTTPMethod:@"GET"];
  [request setURL:[NSURL URLWithString:url]];
  [request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
  [request setTimeoutInterval:20];
  [request setHTTPShouldHandleCookies:FALSE];
  //ephemeralだとメモリ使用量の制限があるらしい。よくわからんが。
  //NSURLSessionが破棄されたタイミングで全てのデータを削除。
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          // connectionError -> error
    NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
    
          if (error) {
              NSLog(@"Error\n");
              return;
          }
    if (statusCode != 200) {
              NSLog(@"200 Error\n");
              NSLog(@"response status code: %ld", (long)statusCode);
              return;
          }
          NSLog(@"Success\n");
          NSArray *json_data = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
          self->_jsonData = json_data;
          //*success_pointer = true;
      }];
      [task resume];//タスクを再開？裏で実行されるっぽい。
  return;
}

@end
