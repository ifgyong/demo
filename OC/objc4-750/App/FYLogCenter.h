//
//  FYLogCenter.h
//  App
//
//  Created by Charlie on 2019/5/27.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>


NS_ASSUME_NONNULL_BEGIN



typedef NS_OPTIONS(NSUInteger, HookOptions) {
    AspectPositionAfter   = 0,            /// Called after the original implementation (default)
    AspectPositionInstead = 1,            /// Will replace the original implementation.
    AspectPositionBefore  = 2,            /// Called before the original implementation.
};


@interface   NSObject (FYLogCenter)

+(void)fyaspect_hookClass:(Class)aclass
            WithSelector:(SEL)selector
             withOptions:(HookOptions)options
              usingBlock:(id)block
                   error:(NSError **)error;
-(void)fyaspect_hookClass:(Class)aclass
            WithSelector:(SEL)selector
             withOptions:(HookOptions)options
              usingBlock:(id)block
                   error:(NSError **)error;

- (void)run;

@end


@interface FYHookClassSEL : NSObject
@property (nonatomic,strong) NSObject *object;
@property (nonatomic,assign)  SEL _SEL;
@property (nonnull,copy) NSArray *beforeSEL;
@property (nonnull,copy) NSArray *afterSEL;
@property (nonnull,copy) NSArray *insteadSEL;
//+ (instancetype)FYHookClassSEL:(SEL)sel hookop:(HookOptions)op;
+ (instancetype)FYHookClassSEL:(SEL)sel options:(HookOptions)ops block:(dispatch_block_t)block;
- (void)addBlock:(id)block HookClassOptions:(HookOptions)ops;
@end

@interface FYHookClass : NSObject
@property (nonatomic,strong) NSMutableArray <FYHookClassSEL*>*selsArray;
@end

NS_ASSUME_NONNULL_END
