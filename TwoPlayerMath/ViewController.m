//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Cay Cornelius on 12/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *solutionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightWrongLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *player2Lives;

@property (nonatomic) GameModel *gameModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _gameModel = [[GameModel alloc] init];
    
    _questionLabel.text = [_gameModel generateQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)press1:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:1];
}
- (IBAction)press2:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:2];
}
- (IBAction)press3:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:3];
}
- (IBAction)press4:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:4];
}
- (IBAction)press5:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:5];
}
- (IBAction)press6:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:6];
}
- (IBAction)press7:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:7];
}
- (IBAction)press8:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:8];
}
- (IBAction)press9:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:9];
}
- (IBAction)press0:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnButtonString:0];
}

- (IBAction)pressMinus:(UIButton *)sender {
    _solutionLabel.text = [_gameModel returnMinusButtonString];
}


- (IBAction)enterButton:(UIButton *)sender {
    Player *currentPlayer = [_gameModel returnCurrentPlayer];
    
    self.rightWrongLabel.text = [_gameModel checkForRightAnswer:currentPlayer.solutionNumber onLabel:_rightWrongLabel];
    
    if (currentPlayer == _gameModel.player1) {
        self.player1Lives.text = [NSString stringWithFormat:@"Player 1 Lives:%d", _gameModel.player1.lives];
        _gameModel.currentPlayer = 2;
    } else {
        self.player2Lives.text = [NSString stringWithFormat:@"Player 2 Lives:%d", _gameModel.player2.lives];
        _gameModel.currentPlayer = 1;
    }
    
    self.rightWrongLabel.hidden = NO;
    
    if (currentPlayer.lives <= 0) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Game over!"
                                      message:@"Do you want to play again?"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yes = [UIAlertAction
                             actionWithTitle:@"Yes"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 _gameModel.player1.lives = 3;
                                 self.player1Lives.text = [NSString stringWithFormat:@"Player 1 Lives:%d", _gameModel.player1.lives];
                                 _gameModel.player2.lives = 3;
                                 self.player2Lives.text = [NSString stringWithFormat:@"Player 2 Lives:%d", _gameModel.player2.lives];
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                                 _gameModel.player1.solutionNumber = 0;
                                 _gameModel.player2.solutionNumber = 0;
                                 _solutionLabel.text = @"solution";
                                 _questionLabel.text = [_gameModel generateQuestion];
                                 
                             }];
        UIAlertAction* no = [UIAlertAction
                                 actionWithTitle:@"No"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     self.rightWrongLabel.text = @"Game over!";
                                     self.rightWrongLabel.hidden = NO;
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:yes];
        [alert addAction:no];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }

    
}



@end
