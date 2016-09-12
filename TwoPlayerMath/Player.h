//
//  Player.h
//  TwoPlayerMath
//
//  Created by Cay Cornelius on 12/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (assign) int lives;
@property (assign) int solutionNumber;

-(void) loseALife;

@end
