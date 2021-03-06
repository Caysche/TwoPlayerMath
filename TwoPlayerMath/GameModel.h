//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Cay Cornelius on 12/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import "Player.h"

@interface GameModel : NSObject

@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;
@property (assign) int currentPlayer;

@property (assign) int summand1;
@property (assign) int summand2;
@property (assign) int sum;
@property (assign) int modusOperandi;

-(NSString *)generateQuestion;
-(Player *)returnCurrentPlayer;
-(NSString *)returnButtonString: (int)forNumber;
-(NSString *)checkForRightAnswer: (int)answer onLabel:(UILabel *)label;
-(NSString *)returnMinusButtonString;

@end
