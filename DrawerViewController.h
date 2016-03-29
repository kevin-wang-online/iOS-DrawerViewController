//
//  DrawerViewController.h
//  DrawerDemo
//
//  Created by Kevin on 14-8-1.
//
//

#import <UIKit/UIKit.h>

@interface DrawerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *middleTableView;
    UITableView *leftTableView;
    UITableView *rightTableView;
    
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *imageView3;
}

@end
