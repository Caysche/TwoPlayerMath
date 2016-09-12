//
//  Player.m
//  TwoPlayerMath
//
//  Created by Cay Cornelius on 12/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lives = 3;
    }
    return self;
}

-(void) loseALife {
    self.lives--;
}

@end
