//
//  ZiXunModelTool.m
//  Text
//
//  Created by 顾海波 on 2018/5/15.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import "ZiXunModelTool.h"
#import "ZiXunModel.h"

#define FilePathWithName(fileName) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName]

#define recommendFilePath FilePathWithName(@"ZiXunInfoFileName")

@implementation ZiXunModelTool

/**
 *  保存音频信息
 */
+ (void) saving : (ZiXunModel *) videoModel
{
    
    NSMutableArray *array = [ZiXunModelTool videoModels];
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
+ (void) removeVideoModel : (ZiXunModel *) model
{
    NSMutableArray *array = [ZiXunModelTool videoModels];
    if (array.count > 0) {
        
        BOOL hasItem = NO;
        ZiXunModel *newItem = nil;
        
        for (ZiXunModel *m in array) {
            if ([m.title isEqualToString:model.title]) {
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

+ (void) updateVideoModel : (ZiXunModel *) newModel
{
    NSMutableArray *array = [ZiXunModelTool videoModels];
    if (array.count > 0) {
        
        BOOL hasItem = NO;
        ZiXunModel *newItem = nil;
        ZiXunModel *oldItem = nil;
        
        for (ZiXunModel *model in array) {
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
