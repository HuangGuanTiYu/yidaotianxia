//
//  MomentsTool.h
//  Text
//
//  Created by 顾海波 on 2018/5/15.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Moments;

@interface MomentsTool : NSObject

/**
 *  保存音频信息
 */
+ (void) saving : (Moments *) videoModel;

/**
 *  取出音频信息
 */
+ (NSMutableArray *)videoModels;

/**
 * 删除所有音频
 */
+ (void) removeVideoModel : (Moments *) model;

+ (void) saveDWDownloadItems : (NSMutableArray *) items;

@end
