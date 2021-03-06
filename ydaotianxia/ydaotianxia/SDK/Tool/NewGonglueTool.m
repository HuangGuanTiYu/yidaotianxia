//
//  NewGonglueTool.m
//  Text
//
//  Created by 顾海波 on 2018/5/14.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "NewGonglueTool.h"
#import "Gonglue.h"

#define FilePathWithName(fileName) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName]

#define recommendFilePath FilePathWithName(@"NewUserInfoFileName")

@implementation NewGonglueTool

/**
 *  保存音频信息
 */
+ (void) saving : (Gonglue *) videoModel
{
    
    NSMutableArray *array = [NewGonglueTool videoModels];
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
+ (void) removeVideoModel : (Gonglue *) model
{
    NSMutableArray *array = [NewGonglueTool videoModels];
    if (array.count > 0) {
        
        BOOL hasItem = NO;
        Gonglue *newItem = nil;
        
        for (Gonglue *model in array) {
            if ([model.title isEqualToString:model.title]) {
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

+ (void) updateVideoModel : (Gonglue *) newModel
{
    NSMutableArray *array = [NewGonglueTool videoModels];
    if (array.count > 0) {
        
        BOOL hasItem = NO;
        Gonglue *newItem = nil;
        Gonglue *oldItem = nil;
        
        for (Gonglue *model in array) {
            if ([model.title isEqualToString:newModel.title]) {
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
