//
//  ChoosyFluidController.h
//  ChoosyFluid
//
//  Created by George on 19/02/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ChoosyFluidController : NSObject 
{
	IBOutlet NSWindow *mainWindow;
	IBOutlet NSPanel *progressPanel;
	
	NSMutableArray *fluidInstances;
	NSString *statusMessage;
}

@property(readwrite,retain) NSMutableArray *fluidInstances;
@property(readwrite,retain) NSString *statusMessage;

- (void)findFluidInstances;

@end
