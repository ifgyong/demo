//
//  FYAppleView.m
//  day18-MVC-Apple
//
//  Created by fgy on 2019/8/5.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYAppleView.h"
#import "FYNewsViewModel.h"
#import "FYItemModel.h"
//#import "KVOController/NSObject+FBKVOController.h"
#import "NSObject+FBKVOController.h"

@interface FYAppleView()
@property (nonatomic,strong) UILabel *nameLabel;
@end
@implementation FYAppleView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        [self addSubview:_nameLabel];
    }
    return self;
}
///*
//  mvc的变种
// */
//- (void)setModel:(FYItemModel *)model{
//    _model = model;
//    _nameLabel.textColor = model.bgColor;
//    _nameLabel.text = model.name;
//	
// 
//}

- (void)setViewModel:(FYNewsViewModel *)viewModel{
    _viewModel = viewModel;
   [_viewModel addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//    __weak typeof(self) waekSelf = self;
//    [self.KVOController observe:viewModel keyPath:@"name"
//                        options:NSKeyValueObservingOptionNew
//                          block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
//        waekSelf.nameLabel.text = change[NSKeyValueChangeNewKey];
//    }];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        self.nameLabel.text = change[NSKeyValueChangeNewKey];
    }
}

//添加点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	if ([self.delegate respondsToSelector:@selector(FYAppleViewDidClick:)]) {
		[self.delegate FYAppleViewDidClick:self];
	}
}
-(void)dealloc{
    [_viewModel removeObserver:self
                    forKeyPath:@"name"];
}
@end
