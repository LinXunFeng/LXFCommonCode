//
//  CMSlideToolBar.m
//  WisdomSiteCloud
//
//  Created by jxj-wcm on 2017/2/22.
//  Copyright © 2017年 xjq. All rights reserved.
//

#import "CMSlideToolBar.h"
#import <objc/runtime.h>

@interface CMSlideToolBar ()


/**indicatorToolBar*/
@property (strong, nonatomic) UIView *indicatorView;
/**shadowView*/
@property (weak, nonatomic) UIView *shadowView;

@property (strong, nonatomic) UIButton *selectBtn;

@end

static CGFloat const btnMargin = 10.0f;


static NSArray *_items;
static BOOL _averageSize;
static UIFont *_font;

@implementation CMSlideToolBar


+(instancetype)creatToolBarWithItems:(NSArray<NSString *> *)items frame:(CGRect)frame avergae:(BOOL)averageSize btnFont:(UIFont *)btnFont delegate:(id<CMSlideToolBarDelegate>) delegate{
    _font = btnFont;
    _items = items;
    _averageSize = averageSize;
    CMSlideToolBar *toolbar = [[CMSlideToolBar alloc] initWithFrame:frame];
    objc_setAssociatedObject(toolbar, @"toolBar", nil,  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    toolbar.delegate = delegate;
    return toolbar;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self setUI];
}


- (void)setUI{
    
    UIButton *_tagBtn;
    
    for(int i = 0; i < _items.count; i++) {
        
        CGFloat itemW = self.frame.size.width / _items.count;
        UIButton *btn = [[UIButton alloc] init];
        btn.backgroundColor = BlueMAIN_Color;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:_items[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateSelected];
        btn.tag = i;
        btn.titleLabel.font = _font;
        [btn.titleLabel sizeToFit];
        
        self.indicatorView.bottom = self.height - self.shadowView.height;
        
        if (_averageSize == NO) {
            
            btn.width = btn.titleLabel.width;
            btn.left = _tagBtn.right + btnMargin;
            btn.top = 0;
            btn.height = self.height;
            
            _tagBtn = btn;
            
        }else{
            btn.frame = CGRectMake(i * itemW , 0, itemW, self.height);
        }
        
        [self addSubview:btn];
        
        if (i == 0) {
            [self btnClick:btn];
        };
    }
    [self addSubview:self.indicatorView];
}

-(void)setMargin:(CGFloat)margin{
    _margin = margin;
    
    UIButton *_tagBtn;
    
    if (_averageSize == true) return;
    
    for (UIButton *btn  in [self loadAllBtns]) {
        
        btn.width = btn.titleLabel.width;
        btn.left = _tagBtn.right + _margin;
        btn.top = 0;
        btn.height = self.height;
        _tagBtn = btn;
    }
    
    [self btnClick:self.selectBtn];
}

-(void)setIndicatorColor:(UIColor *)indicatorColor{
    _indicatorColor = indicatorColor;
    self.indicatorView.backgroundColor = _indicatorColor;
}

-(void)setIndicatorViewH:(CGFloat)indicatorViewH{
    _indicatorViewH = indicatorViewH;
    self.indicatorView.height = self.indicatorViewH;
}
- (void)setIndicatorViewW:(CGFloat)indicatorViewW{
    _indicatorViewW = indicatorViewW;
    self.indicatorView.width = self.indicatorViewW;
    
    self.indicatorView.centerX = _selectBtn.centerX;
    
    
}
-(void)setIndicatorBottomMargin:(CGFloat)indicatorBottomMargin{
    _indicatorBottomMargin = indicatorBottomMargin;
    self.indicatorView.bottom = self.height -  indicatorBottomMargin;
}

-(void)btnClick:(UIButton *)btn{
    
    if (_selectBtn == btn) {
        return;
    }
    
    self.selectBtn.selected = false;
    btn.selected = true;
    self.selectBtn = btn;
    
    
    __weak CMSlideToolBar * weakSelf = self;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        weakSelf.indicatorView.width = weakSelf.indicatorViewW != 0 ?weakSelf.indicatorViewW:btn.titleLabel.width + 10;
        
        weakSelf.indicatorView.centerX = btn.centerX;
    }];
    
    //    id<CMSlideToolBarDelegate>delegate = objc_getAssociatedObject(self, @"toolBar");
    
    /**代理传出*/
    if ([self.delegate respondsToSelector:@selector(slideToolBar:didSelectIndex:) ]) {
        [self.delegate slideToolBar:self didSelectIndex:btn.tag];
    }
}



-(void)setBtnFont:(UIFont *)btnFont{
    _btnFont = btnFont;
    
    //    NSArray *btns = [self loadAllBtns];
    //    for (UIButton *btn in btns) {
    //        btn.titleLabel.font = _btnFont;
    //    }
    
    
}


-(NSArray *)loadAllBtns{
    
    NSMutableArray *btns = @[].mutableCopy;
    for (UIView *view in self.subviews) {
        if ([view isMemberOfClass:[UIButton class]]) {
            [btns addObject:view];
        }
    }
    return btns;
}

-(void)setFontColor:(UIColor *)fontColor{
    
    _fontColor = fontColor;
    NSArray *btns = [self loadAllBtns];
    for (UIButton *btn in btns) {
        [btn setTitleColor:_fontColor forState:UIControlStateNormal];
    }
}

-(UIView *)indicatorView{
    
    if (!_indicatorView) {
        self.indicatorView = [[UIView alloc] init];
        self.indicatorView.backgroundColor = [UIColor whiteColor];
        self.indicatorView.height = 2;
        self.indicatorView.bottom = self.height- self.shadowView.height;
    }return _indicatorView;
}


-(void)setShadowH:(CGFloat)shadowH{
    _shadowH = shadowH;
    
    self.shadowView.height = _shadowH;
}
-(UIView *)shadowView{
    if (!_shadowView) {
        
        UIView *shadowView = [[UIView alloc] init];
        shadowView.backgroundColor = BlueMAIN_Color;
        shadowView.frame = CGRectMake(0, self.height - 1, self.width, 1);
        self.shadowView = shadowView;
        [self addSubview:self.shadowView];
    }return _shadowView;
}


-(void)setSelectColor:(UIColor *)selectColor{
    _selectColor = selectColor;
    
    for (UIButton *btn  in [self loadAllBtns]) {
        [btn setTitleColor:_selectColor forState:UIControlStateSelected];
    }
    
}

-(void)setNormalColor:(UIColor *)normalColor{
    _normalColor = normalColor;
    for (UIButton *btn  in [self loadAllBtns]) {
        [btn setTitleColor:_normalColor forState:UIControlStateNormal];
    }
}


-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    
    NSArray *btns = [self loadAllBtns];
    for (UIButton *btn  in btns) {
        if (btn.tag == _currentIndex) {
            
            self.selectBtn.selected = false;
            btn.selected = true;
            self.selectBtn = btn;
            __weak CMSlideToolBar * weakSelf = self;
            
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.indicatorView.width = weakSelf.indicatorViewW != 0 ?weakSelf.indicatorViewW: btn.titleLabel.width;
                weakSelf.indicatorView.centerX = btn.centerX;
            }];
        }
    }
}


@end
