//
//  ChoosyFluidController.m
//  ChoosyFluid
//
//  Created by George on 19/02/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import "ChoosyFluidController.h"


@implementation ChoosyFluidController

@synthesize 
	fluidInstances,
	statusMessage;

- (void)applicationDidFinishLaunching:(NSNotification*)notification
{
	// Initialise the array for discovered fluid instances
	self.fluidInstances = [NSMutableArray array];
	
	// Display the progress panel
	[NSApp beginSheet:progressPanel	modalForWindow:mainWindow modalDelegate:self didEndSelector:NULL contextInfo:nil];
		
	// Begin the search for fluid instances
	[self findFluidInstances];
}

- (void)findFluidInstances
{
	self.statusMessage = @"Searching for Fluid instances";
}

@end
