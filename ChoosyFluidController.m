//
//  ChoosyFluidController.m
//  ChoosyFluid
//
//  Created by George on 19/02/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import "ChoosyFluidController.h"


@implementation ChoosyFluidController

@synthesize fluidInstances;

- (void)awakeFromNib
{
	// Initialise the array for discovered fluid instances
	self.fluidInstances = [NSMutableArray array];
}

@end
