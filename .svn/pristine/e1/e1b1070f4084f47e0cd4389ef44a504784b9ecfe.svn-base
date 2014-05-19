//
//  CheckVersionUpdate.m
//  FurnitureShow
//
//  Created by mosh on 13-8-2.
//  Copyright (c) 2013年 cn.mosh. All rights reserved.
//

#import "CheckVersionUpdate.h"
#import "ServerRequest.h"
#import "GlobalConfig.h"

@implementation CheckVersionUpdate


- (void) checkVersion
{
    self.request = [ServerRequest serverRequest];
    [self.request beginRequestWithUrl:[NSString stringWithFormat:URL_VERSION,[GlobalConfig appVersion],[GlobalConfig bundleID]]
                         isAppendHost:YES
                            isEncrypt:YES
                              success:^(id json){
                              
                                  [self success:json];
                              }
                                 fail:^{
                                     
                                 }];
}

- (void) success:(id)dic
{
    if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:dic]) {
        NSDictionary *json = [GlobalConfig convertToDictionary:dic[JSONKEY]];
        
        if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:json]) {
            NSString *message = [GlobalConfig convertToString:json[@"tips"]];
            self.downloadUrl = [GlobalConfig convertToString:json[@"downloadurl"]];
            
            if ([GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:message] && [GlobalConfig isKindOfNSStringClassAndLenthGreaterThanZero:self.downloadUrl]) {
                UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [view show];
            }
        }
    }
}

#pragma mark - alertViewDelegate -
//版本更新成功提示按钮
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.downloadUrl]];
    }
}




@end
