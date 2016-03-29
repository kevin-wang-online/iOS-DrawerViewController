//
//  DrawerViewController.m
//  DrawerDemo
//
//  Created by Kevin on 14-8-1.
//
//

#import "DrawerViewController.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"抽屉效果";
    
    [self.view setFrame:CGRectMake(0, 0, 960, DeviceHeight)];
    
    self.view.center = CGPointMake(320 + 160, self.view.center.y);
    
    [self loadNavigationItems];
    
    [self loadDrawerSubview];
    
    [self loadMiddleView];
    [self loadLeftDrawerView];
    [self loadRightDrawerView];
}

/**
 *  加载ViewController整个视图框架
 */
- (void)loadDrawerSubview
{
    imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, DeviceHeight)];
    imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 64, 320, DeviceHeight)];
    imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(640, 64, 320, DeviceHeight)];
    
    imageView1.image = [UIImage imageNamed:@"001.jpg"];
    imageView2.image = [UIImage imageNamed:@"002.jpg"];
    imageView3.image = [UIImage imageNamed:@"003.jpg"];
    
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    [self.view addSubview:imageView3];
}

/**
 *  加载导航栏按钮信息
 */
- (void)loadNavigationItems
{
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"左抽屉" style:UIBarButtonItemStylePlain target:self
                                                                     action:@selector(showLeftDrawer:)];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"右抽屉" style:UIBarButtonItemStylePlain target:self action:@selector(showRightDrawer:)];
    UIBarButtonItem *leftRefreshBarButton = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(backToTheMiddleView:)];
    
    NSArray *leftBarButtonsArray = [[NSArray alloc] initWithObjects:leftBarButton,leftRefreshBarButton, nil];
    
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    self.navigationItem.leftBarButtonItems = leftBarButtonsArray;
}

/**
 *  加载中部表格视图
 */
-(void)loadMiddleView
{
    middleTableView = [[UITableView alloc] initWithFrame:CGRectMake( 320, 64, DeviceWidth, DeviceHeight)];
    
    middleTableView.delegate = self;
    middleTableView.dataSource = self;
    
    [self.view addSubview:middleTableView];
}

/**
 *  加载左侧抽屉视图
 */
- (void)loadLeftDrawerView
{
    leftTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 64, DeviceWidth/2, DeviceHeight)];
    
    leftTableView.delegate = self;
    leftTableView.dataSource = self;
    
    [self.view addSubview:leftTableView];
}

/**
 *  加载右侧抽屉视图
 */
- (void)loadRightDrawerView
{
    rightTableView = [[UITableView alloc] initWithFrame:CGRectMake( 640, 64, DeviceWidth/2, DeviceHeight)];
    
    rightTableView.delegate = self;
    rightTableView.dataSource = self;
    
    [self.view addSubview:rightTableView];
}

/**
 *  显示左侧抽屉视图
 *
 *  @param sender 动作发起者
 */
- (void)showLeftDrawer:(id)sender
{
    [self loadLeftDrawerView];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView: self.view cache:YES];
    [UIView setAnimationDelegate:self];
    
    CGFloat moveX = DeviceWidth / 2;
    CGFloat moveY = self.view.center.y;
    
    self.view.center = CGPointMake( 160, moveY);
    
    [UIView commitAnimations];
}

/**
 *  显示右侧抽屉式图
 *
 *  @param sender 动作发起者
 */
- (void)showRightDrawer:(id)sender
{
    [self loadRightDrawerView];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView: self.view cache:YES];
    [UIView setAnimationDelegate:self];
    
    CGFloat moveX = DeviceWidth / 2;
    CGFloat moveY = self.view.center.y;
    
    self.view.center = CGPointMake(640 + 160, moveY);
    
    [UIView commitAnimations];
}

/**
 *  返回界面中部
 *
 *  @param sender 动作发起者
 */
- (void)backToTheMiddleView:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView: self.view cache:YES];
    [UIView setAnimationDelegate:self];
    
    CGFloat moveX = DeviceWidth / 2;
    CGFloat moveY = self.view.center.y;
    
    self.view.center = CGPointMake(320 + 160 , moveY);
    
    [UIView commitAnimations];
}

#pragma mark - 
#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.textLabel.text = @"展示信息";
    }
    
    return cell;
}


#pragma mark -
#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"123");
}


@end
