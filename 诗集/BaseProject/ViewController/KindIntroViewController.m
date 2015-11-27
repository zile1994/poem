//
//  KindIntroViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindIntroViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface KindIntroViewController ()<AVSpeechSynthesizerDelegate>
//多行编辑器，用于显示多行文本,用法与textfield一致
@property(nonatomic,strong) UITextView *textView;
//语音功能
@property(nonatomic,strong) AVSpeechSynthesizer *spe;
//右上角朗读按钮
@property(nonatomic,strong) UIBarButtonItem *readItem;
@end
@implementation KindIntroViewController
- (UIBarButtonItem *)readItem{
    if (!_readItem) {
        _readItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"朗读" style:UIBarButtonItemStyleDone handler:^(id sender) {
            if (self.spe.speaking) {
                [self.spe stopSpeakingAtBoundary:AVSpeechBoundaryWord];
                return;
            }
            AVSpeechUtterance *utt =[AVSpeechUtterance speechUtteranceWithString:_introKind];
            utt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
            [self.spe speakUtterance:utt];
            
        }];
    }
    return _readItem;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.spe stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (AVSpeechSynthesizer *)spe{
    if (!_spe) {
        _spe = [AVSpeechSynthesizer new];
        _spe.delegate = self;
    }
    return _spe;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.font=[UIFont systemFontOfSize:18];
//不可编辑
        _textView.editable = NO;
    }
    return _textView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.textView.text = _introKind;
    self.textView.contentOffset = CGPointMake(0, 0);
    
    self.navigationItem.rightBarButtonItem = self.readItem;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    self.readItem.title = @"停止";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    self.readItem.title = @"朗读";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    self.readItem.title = @"朗读";
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

@end
