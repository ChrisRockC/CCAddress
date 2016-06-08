//
//  CCHomeController.m
//  Address
//
//  Created by CC on 16/6/8.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "CCHomeController.h"
#import <AddressBook/AddressBook.h>

@interface CCHomeController ()

@end

@implementation CCHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    [self getAddress];
}

///  在iOS9之前，有两个框架可以访问用户的通讯录
//1.AddressBookUI.framework
//提供了联系人列表页面  联系人详情页面 添加联系人页面   一般用于选择联系人

//2.AddressBook.framework 纯C语言的API 仅仅是获得联系人的数据

//3.在iOS6开始，需要获得用户授权才能够访问通讯录，因此在使用之前，应该检查用户是否已经授权
//ABAddressBookGetAuthorizationStatus()

//4.iOS9之后，用Contacts.framework ContactsUI.framework代替

-(void)getAddress{
    
}



@end
