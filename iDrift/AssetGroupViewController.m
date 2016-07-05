//
//  AssetGroupViewController.m
//  iDrift
//
//  Created by Sophie Jeong on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "AssetGroupViewController.h"
#import "AssetViewController.h"
#import "AssetGroupTableCell.h"
#import "VideoViewController.h"

@interface AssetGroupViewController ()
- (void)retrieveAssetGroupByURL;
- (void)enumerateGroupAssetsForGroup:(ALAssetsGroup *)group;
@end

@implementation AssetGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:self.assetGroupName];
    
    NSRange cameraRollLoc =
    [self.assetGroupName rangeOfString:@"Camera Roll"];
    
    if (cameraRollLoc.location == NSNotFound)
    {
       
        NSLog(@"not Camera Roll Found");
    }
    
    ALAssetsLibrary *setupAssetsLibrary =
    [[ALAssetsLibrary alloc] init];
    
    [self setAssetsLibrary:setupAssetsLibrary];
    
    NSMutableArray *setupArray = [[NSMutableArray alloc] init];
    [self setAssetArray:setupArray];
    
    [self retrieveAssetGroupByURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ViewAssetImage"])
    {
        NSInteger indexForAsset = [sender tag];
        
        ALAsset *selectedAsset =
        [_assetArray objectAtIndex:indexForAsset];
        AssetViewController *aVC =
        segue.destinationViewController;
        
        if ([[selectedAsset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {
            
            NSLog(@"See Asset: %@", [[selectedAsset defaultRepresentation] url]);
//
            NSURL *myURL = [[selectedAsset defaultRepresentation] url];
            aVC.isVideo = YES;
            aVC.videoURL = myURL;
         
            NSLog(@"VIEW VIDEO");
            
        }else{
            NSLog(@"VIEW IMAGE");
            aVC.isVideo = NO;
        
        ALAssetRepresentation *rep =
        [selectedAsset defaultRepresentation];
        
        
        UIImage *img =
        [UIImage imageWithCGImage:[rep fullScreenImage]];
        
        [aVC setAssetImage:img];
        }
    }
}

#pragma mark - Table methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger returnCount = 0;
    
    if (_assetArray && ([_assetArray count] > 0))
    {
        if ([_assetArray count] % 4 == 0)
        {
            returnCount = ([_assetArray count] / 4);
        }
        else
        {
            returnCount = ([_assetArray count] / 4) + 1;
        }
    }
    return returnCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"AssetGroupTableCell";
    AssetGroupTableCell *cell = (AssetGroupTableCell *)
    [tableView dequeueReusableCellWithIdentifier:cellID];
    
    ALAsset *firstAsset =
    [_assetArray objectAtIndex:indexPath.row * 4];
    
    [cell.assetButton1 setImage:
     [UIImage imageWithCGImage:[firstAsset thumbnail]]
                       forState:UIControlStateNormal];
    
    [cell.assetButton1 setTag:indexPath.row * 4];
    
    if (indexPath.row * 4 + 1 < [_assetArray count])
    {
        ALAsset *secondAsset =
        [_assetArray objectAtIndex:indexPath.row * 4 + 1];
        
        [cell.assetButton2 setImage:
         [UIImage imageWithCGImage:[secondAsset thumbnail]]
                           forState:UIControlStateNormal];
        
        [cell.assetButton2 setTag:indexPath.row * 4 + 1];
        [cell.assetButton2 setEnabled:YES];
    }
    else
    {
        [cell.assetButton2 setImage:nil
                           forState:UIControlStateNormal];
        
        [cell.assetButton2 setEnabled:NO];
    }
    
    if (indexPath.row * 4 + 2 < [_assetArray count])
    {
        ALAsset *thirdAsset =
        [_assetArray objectAtIndex:indexPath.row * 4 + 2];
        
        [cell.assetButton3 setImage:
         [UIImage imageWithCGImage:[thirdAsset thumbnail]]
                           forState:UIControlStateNormal];
        
        [cell.assetButton3 setTag:indexPath.row * 4 + 2];
        [cell.assetButton3 setEnabled:YES];
    }
    else
    {
        [cell.assetButton3 setImage:nil
                           forState:UIControlStateNormal];
        
        [cell.assetButton3 setEnabled:NO];
    }
    
    if (indexPath.row * 4 + 3 < [_assetArray count])
    {
        ALAsset *fourthAsset =
        [_assetArray objectAtIndex:indexPath.row * 4 + 3];
        
        [cell.assetButton4 setImage:
         [UIImage imageWithCGImage:[fourthAsset thumbnail]]
                           forState:UIControlStateNormal];
        
        [cell.assetButton4 setTag:indexPath.row * 4 + 3];
        [cell.assetButton4 setEnabled:YES];
    }
    else
    {
        [cell.assetButton4 setImage:nil
                           forState:UIControlStateNormal];
        
        [cell.assetButton4 setEnabled:NO];
    }
    
    return cell;
}

#pragma mark - Asset Methods

- (void)retrieveAssetGroupByURL
{
    void (^retrieveGroupBlock)(ALAssetsGroup*) =
    ^(ALAssetsGroup* group)
    {
        if (group)
        {
            [self enumerateGroupAssetsForGroup:group];
        }
        else
        {
            NSLog(@"Error. Can't find group!");
        }
    };
    
    void (^handleAssetGroupErrorBlock)(NSError*) =
    ^(NSError* error)
    {
        NSString *errMsg = @"Error accessing group";
        
        UIAlertView* alertView =
        [[UIAlertView alloc] initWithTitle:nil
                                   message:errMsg
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        
        [alertView show];
    };
    
    [self.assetsLibrary groupForURL:self.assetGroupURL
                        resultBlock:retrieveGroupBlock
                       failureBlock:handleAssetGroupErrorBlock];
}

- (void)enumerateGroupAssetsForGroup:(ALAssetsGroup *)group
{
    NSInteger lastIndex = [group numberOfAssets] - 1;
    
    void (^addAsset)(ALAsset*, NSUInteger, BOOL*) =
    ^(ALAsset* result, NSUInteger index, BOOL* stop)
    {
        if (result != nil)
        {
            [self.assetArray addObject:result];
//            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {
//                NSLog(@"See Asset: %@", [[result defaultRepresentation] url]);
//            }
        }
        
        if (index == lastIndex) {
//reverse array refer to http://stackoverflow.com/questions/586370/how-can-i-reverse-a-nsarray-in-objective-c
            self.assetArray = [[self.assetArray reverseObjectEnumerator] allObjects];
            [self.assetTableView reloadData];
        }
    };
    
    [group enumerateAssetsUsingBlock:addAsset];
}



@end
