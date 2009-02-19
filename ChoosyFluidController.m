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
	
	// Begin the progress bar animation
	[progressBar animate:nil];
		
	// Begin the search for fluid instances in all possible directories
	NSArray *applicationsDirectories = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSAllDomainsMask, TRUE);
	NSString *path;
	NSEnumerator *applicationDirectoryEnumerator = [applicationsDirectories objectEnumerator];
	while(path = [applicationDirectoryEnumerator nextObject])
		[self findFluidInstancesInDirectory:path];
		
	NSLog(@"Found: %@", fluidInstances);
}

- (void)findFluidInstancesInDirectory:(NSString*)path
{
	// Update the UI's status message
	self.statusMessage = [NSString stringWithFormat:@"Searching for Fluid instances in %@", path];
	
	// Enumerate over the application in the directory
	NSString *file;
	NSString *appPath;
	NSBundle *appBundle;
	NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while(file = [fileEnumerator nextObject])
	{
		if([[file pathExtension] isEqualToString:@"app"])
		{
			// Get a bundle object for the application
			appPath = [path stringByAppendingPathComponent:file];
			appBundle = [[NSBundle alloc] initWithPath:appPath];
			
			// Check the bundle identifier
			NSRange fluidInstanceRange = [[appBundle bundleIdentifier] rangeOfString:@"com.fluidapp.FluidInstance."];
			if(fluidInstanceRange.location == 0)
				[fluidInstances addObject:appPath];
			
			// Tidy up
			[appBundle release], appBundle = nil;
		
			// Don't descend into app's contents
			[fileEnumerator skipDescendents];
		}
	}
	
}

@end
