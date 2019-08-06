//
//  FYAppleView.m
//  day18-MVC-Apple
//
//  Created by fgy on 2019/8/5.
//  Copyright © 2019 test. All rights reserved.
//

#import "FYAppleView.h"
#import "FYItemModel.h"
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
/*
  mvc的变种
 */
- (void)setModel:(FYItemModel *)model{
    _model = model;
    _nameLabel.textColor = model.bgColor;
    _nameLabel.text = model.name;
	
	__weak typeof(self) weakself = self;
	self.
}
//添加点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	if ([self.delegate respondsToSelector:@selector(FYAppleViewDidClick:)]) {
		[self.delegate FYAppleViewDidClick:self];
	}
}
@end
