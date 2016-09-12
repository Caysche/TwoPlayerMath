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

-(NSString *)generateQuestion {
    _modusOperandi = arc4random_uniform(3) + 1;
    self.summand1 = arc4random_uniform(20) + 1;
    self.summand2 = arc4random_uniform(20) + 1;
    if(_modusOperandi == 1) {
        NSString *additionQuestion = [NSString stringWithFormat:@"Player %d: %d + %d = ?", self.currentPlayer, self.summand1, self.summand2];
            return additionQuestion;
    } else if (_modusOperandi == 2) {
        NSString *substractionQuestion = [NSString stringWithFormat:@"Player %d: %d - %d = ?", self.currentPlayer, self.summand1, self.summand2];
        return substractionQuestion;
    } else {
        NSString *multiplicationQuestion = [NSString stringWithFormat:@"Player %d: %d * %d = ?", self.currentPlayer, self.summand1, self.summand2];
        return multiplicationQuestion;
    }
}

-(NSString *) checkForRightAnswer: (int)answer onLabel:(UILabel *)label {
    NSString *outPutText = [[NSString alloc] init];
    Player *currentPlayer = [self returnCurrentPlayer];
    
    if(_modusOperandi == 1) {
        self.sum = self.summand1 + self.summand2;
    } else if (_modusOperandi == 2) {
        self.sum = self.summand1 - self.summand2;
    } else {
        self.sum = self.summand1 * self.summand2;
    }
    

    if (answer == self.sum) {
        outPutText = @"You are right!";
        if (currentPlayer == self.player1) {
            self.currentPlayer = 2;
        } else {
            self.currentPlayer = 1;
        }
        label.textColor = [UIColor greenColor];
        label.alpha = 1;
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ label.alpha = 0;}
                         completion:nil];
        return outPutText;
    } else {
        [currentPlayer loseALife];
        if (currentPlayer.lives <= 0) {
            outPutText = [NSString stringWithFormat:@"You are wrong! Player %d has lost the game", self.currentPlayer];
        } else {
            outPutText = @"You are wrong!";
        }
        label.textColor = [UIColor redColor];
        label.alpha = 1;
        
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ label.alpha = 0;}
                         completion:nil];
        return outPutText;
    }

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

-(NSString *)returnMinusButtonString {
    [self returnCurrentPlayer].solutionNumber = -[self returnCurrentPlayer].solutionNumber;
    return [NSString stringWithFormat:@"%d", [self returnCurrentPlayer].solutionNumber];
}

@end
