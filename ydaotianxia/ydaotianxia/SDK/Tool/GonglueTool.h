//
//  GonglueTool.h
//  TxtLookFramework
//
//  Created by 顾海波 on 2018/5/10.
//  Copyright © 2018年 com.txtLook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Gonglue;

@interface GonglueTool : NSObject

/**
 *  保存音频信息
 */
+ (void) saving : (Gonglue *) videoModel;

/**
 *  取出音频信息
 */
+ (NSMutableArray *)videoModels;

/**
 * 删除所有音频
 */
+ (void) removeVideoModel : (Gonglue *) model;

+ (void) saveDWDownloadItems : (NSMutableArray *) items;

@end
