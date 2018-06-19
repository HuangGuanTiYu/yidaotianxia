//
//  MomentsTool.m
//  Text
//
//  Created by 顾海波 on 2018/5/15.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "MomentsTool.h"
#import "Moments.h"
#define FilePathWithName(fileName) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName]

#define recommendFilePath FilePathWithName(@"MomentsToolInfoFileName")

@implementation MomentsTool

/**
 *  保存音频信息
 */
+ (void) saving : (Moments *) videoModel
{
    
    NSMutableArray *array = [MomentsTool videoModels];
    if (array == nil) {
        array = [NSMutableArray array];
    }
    [array insertObject:videoModel atIndex:0];
    [NSKeyedArchiver archiveRootObject:array toFile:recommendFilePath];
}

/**
 *  取出音频信息
 */
+ (NSMutableArray *)videoModels
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:recommendFilePath];
}

/**
 * 删除所有音频
 */
+ (void) removeVideoModel : (Moments *) model
{
    NSMutableArray *array = [MomentsTool videoModels];
    if (array.count > 0) {
        
        BOOL hasItem = NO;
        Moments *newItem = nil;
        
        for (Moments *m in array) {
            if ([m.text isEqualToString:model.text]) {
                hasItem = YES;
                newItem = model;
            }
        }
        
        if (hasItem) {
            
            [array removeObject:newItem];
            
            [self saveDWDownloadItems:array];
        }
    }
    
}

/**
 *  批量保存下载信息
 */
+ (void) saveDWDownloadItems : (NSMutableArray *) items
{
    [NSKeyedArchiver archiveRootObject:items toFile:recommendFilePath];
}

+ (void) updateVideoModel : (Moments *) newModel
{
    NSMutableArray *array = [MomentsTool videoModels];
    if (array.count > 0) {
        
        BOOL hasItem = NO;
        Moments *newItem = nil;
        Moments *oldItem = nil;
        
        for (Moments *model in array) {
            if ([model.text isEqualToString:newModel.text]) {
                hasItem = YES;
                newItem = newModel;
                oldItem = model;
            }
        }
        
        if (hasItem) {
            
            [array replaceObjectAtIndex:[array indexOfObject:oldItem] withObject:newItem];
            
            [self saveDWDownloadItems:array];
        }
    }
    
}

@end
