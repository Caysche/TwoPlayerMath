//
//  GameModel.m
//  TwoPlayerMath
//
//  Created by Cay Cornelius on 12/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player1 = [[Player alloc] init];
        _player2 = [[Player alloc] init];
        _currentPlayer = 1;
    }
    return self;
}

-(NSString *)generateAdditionQuestion {
    
    self.summand1 = arc4random_uniform(20) + 1;
    self.summand2 = arc4random_uniform(20) + 1;
    
    NSString *additionQuestion = [NSString stringWithFormat:@"Player %d: %d + %d = ?", self.currentPlayer, self.summand1, self.summand2];
    
    return additionQuestion;
}

-(NSString *) checkForRightAnswer: (int)answer {
    NSString *outPutText = [[NSString alloc] init];
    Player *currentPlayer = [self returnCurrentPlayer];
    self.sum = self.summand1 + self.summand2;
    if (answer == self.sum) {
        outPutText = @"You are right!";
        if (currentPlayer == self.player1) {
            self.currentPlayer = 2;
        } else {
            self.currentPlayer = 1;
        }
        return outPutText;
    } else {
        [currentPlayer loseALife];
        if (currentPlayer.lives <= 0) {
            outPutText = [NSString stringWithFormat:@"You are wrong! Player %d has lost the game", self.currentPlayer];
        } else {
            outPutText = @"You are wrong!";
        }
        
        return outPutText;
    }
//    
//    if ([_gameModel checkForRightAnswer:[_gameModel returnCurrentPlayer].solutionNumber]) {
//        self.rightWrongLabel.text = @"You are right!";
//        self.rightWrongLabel.hidden = NO;
//        if (currentPlayer == _gameModel.player1) {
//            _gameModel.currentPlayer = 2;
//        } else {
//            _gameModel.currentPlayer = 1;
//        }
//    } else {
//        [currentPlayer loseALife];
//        if (currentPlayer.lives <= 0) {
//            self.rightWrongLabel.text = [NSString stringWithFormat:@"You are wrong! Player %d has lost the game", _gameModel.currentPlayer];
//            self.rightWrongLabel.hidden = NO;
//        } else {
//            self.rightWrongLabel.text = @"You are wrong!";
//            self.rightWrongLabel.hidden = NO;
//        }
//        
//        if (currentPlayer == _gameModel.player1) {
//            self.player1Lives.text = [NSString stringWithFormat:@"Player 1 Lives:%d", _gameModel.player1.lives];
//            _gameModel.currentPlayer = 2;
//        } else {
//            self.player2Lives.text = [NSString stringWithFormat:@"Player 2 Lives:%d", _gameModel.player2.lives];
//            _gameModel.currentPlayer = 1;
//        }
//    }

}

-(Player *)returnCurrentPlayer {
    if (self.currentPlayer == 1) {
        return self.player1;
    } else {
        return self.player2;
    }
}

-(NSString *)returnButtonString: (int)forNumber {
    int oldSolution = [self returnCurrentPlayer].solutionNumber;
    [self returnCurrentPlayer].solutionNumber = [[NSString stringWithFormat:@"%d%d", oldSolution, forNumber] intValue];
    NSString *outputString = [NSString stringWithFormat:@"%d", [self returnCurrentPlayer].solutionNumber];
    return outputString;
}

@end
