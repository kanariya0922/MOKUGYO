//
//  ViewController.m
//  MOKUGYO
//
//  Created by kanariya0922 on 12/09/10.
//  Copyright (c) 2012年 . All rights reserved.

#import "ViewController.h"

@implementation ViewController
@synthesize labelCount;
@synthesize labelX,labelY,labelZ;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIAccelerometer *acceleremoter = [UIAccelerometer sharedAccelerometer];
    acceleremoter.updateInterval = 0.1;
    acceleremoter.delegate = self;
    
    count = 0;
    labelCount.text = [NSString stringWithFormat:@"%d",count];
    
}

-(void)playSound:(NSString *)soundFileName {
    
    isPlay = YES;
    
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:soundFileName ofType:@"wav"];
    NSURL *fileURL = [NSURL fileURLWithPath:path];
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    
    if (error){
        return;
    }
    
    audioPlayer.delegate = self;
    [audioPlayer play];
    
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    [player release];
    isPlay = NO;
    
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    const float violence = 1.5;
	static BOOL beenhere;
	BOOL shake = FALSE;
    
    self.labelX.text = [NSString stringWithFormat:@"x:%f",acceleration.x];
    self.labelY.text = [NSString stringWithFormat:@"y:%f",acceleration.y];
    self.labelZ.text = [NSString stringWithFormat:@"z:%f",acceleration.z];
    
    if (isPlay) return;
    
	if (beenhere) return;
	beenhere = TRUE;
	if (acceleration.x > violence || acceleration.x < (-1* violence))
		shake = TRUE;
	if (acceleration.y > violence || acceleration.y < (-1* violence))
		shake = TRUE;
	if (acceleration.z > violence || acceleration.z < (-1* violence))
		shake = TRUE;
    
    
    if (shake){
        [self playSound:@"WoodBlock"];
        count++;
        labelCount.text = [NSString stringWithFormat:@"%d",count];
    }
    beenhere = false;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)viewDidUnload {
    [self setLabelX:nil];
    [self setLabelY:nil];
    [self setLabelZ:nil];
    [self setLabelCount:nil];
    [super viewDidUnload];
}
- (void)dealloc {
    //    [labelCount release];
    [super dealloc];
}
@end
