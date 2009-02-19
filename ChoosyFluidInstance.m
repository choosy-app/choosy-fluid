//
//  ChoosyFluidInstance.m
//  ChoosyFluid
//
//  Created by George on 19/02/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import "ChoosyFluidInstance.h"


@implementation ChoosyFluidInstance

@synthesize
	path,
	name,
	icon;

- (id)initWithPath:(NSString*)newPath
{
	self = [super init];
	if(self)
		self.path = newPath;
		
	return self;
}

- (void)setPath:(NSString*)newPath
{
	if(newPath == path || ![[NSWorkspace sharedWorkspace] isFilePackageAtPath:newPath])
		return;
		
	[self willChangeValueForKey:@"path"];
	[path release], path = [newPath retain];
	[self didChangeValueForKey:@"path"];
	
	[self willChangeValueForKey:@"name"];
	[name release], name = [[[newPath lastPathComponent] stringByDeletingPathExtension] retain];
	[self didChangeValueForKey:@"name"];
	
	[self willChangeValueForKey:@"icon"];
	[icon release], icon = [[[NSWorkspace sharedWorkspace] iconForFile:newPath] retain];
	[self didChangeValueForKey:@"icon"];
}

- (void)dealloc
{
	[path release], path = nil;
	[name release], name = nil;
	[icon release], icon = nil;
	[super dealloc];
}

@end