//
//  ViewController.m
//  BucketList
//
//  Created by MDREZAUL KARIM on 8/16/16.
//  Copyright © 2016 Karim. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataStack.h"
#import "BucketList.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSMutableArray * arrayOfList;
    BOOL isUpdating;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     arrayOfList = [[NSMutableArray alloc]init];
    isUpdating = NO;
    
    [self refreshData];
    
    
}
- (IBAction)buttonclicked:(id)sender {
    
    
    
    CoreDataStack * cds = [CoreDataStack coreDataStack];
    if (!isUpdating) {
        if (!([self.myTextField.text length]<=0)) {
            [cds addToList:self.myTextField.text];
        }
        
    }else{
        
        NSIndexPath * indexPath = [self.myTableview indexPathForSelectedRow];
        BucketList * blist = [arrayOfList objectAtIndex:indexPath.row];
        [cds updateItem:self.myTextField.text forItem:blist];
        isUpdating = NO;
        [self.myButton setTitle:@"Add" forState:UIControlStateNormal];
    }
    
    
   
    [self refreshData];
    
   
}
-(void)refreshData {
    [arrayOfList removeAllObjects];
    
    CoreDataStack * cds = [CoreDataStack coreDataStack];
      
    
    [arrayOfList addObjectsFromArray:[cds getAllItems]];
    
    
    NSLog(@"%@",arrayOfList);
    
   
    self.myTextField.text = @"";
    
    [self.myTableview reloadData];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return arrayOfList.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self.myTableview dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    BucketList * blist =[arrayOfList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = blist.item;
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    BucketList * blist = [arrayOfList objectAtIndex:indexPath.row];
    
    self.myTextField.text = blist.item;
    
    [self.myButton setTitle:@"Update" forState:UIControlStateNormal];
    isUpdating = YES;
    
    
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BucketList * blist = [arrayOfList objectAtIndex:indexPath.row];
        [arrayOfList removeObjectAtIndex:indexPath.row];
        CoreDataStack * cds = [CoreDataStack coreDataStack];
        [cds.managedObjectContext deleteObject:blist];
        [cds saveContext];
        [self.myTableview reloadData];
    }
    
    
    
}
@end
