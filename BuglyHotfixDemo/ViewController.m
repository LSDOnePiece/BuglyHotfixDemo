//
//  ViewController.m
//  BuglyHotfixDemo
//
//  Created by ls on 2016/12/18.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

///
@property(strong,nonatomic)NSArray *dataArray;

@end


static NSString *TableViewCellReusedIdentifier = @"TableViewCellReusedIdentifier";
@implementation ViewController

-(NSArray *)dataArray
{
    
    if (_dataArray == nil) {
        _dataArray = @[@"1",@"2",@"3",@"4",@"5"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellReusedIdentifier];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellReusedIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellReusedIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    
    return  cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *string = [self.dataArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@",string);
}

@end
