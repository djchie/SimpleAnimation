//
//  ViewController.m
//  SimpleAnimation
//
//  Created by Simon on 30/3/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Load images
    NSArray *imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                        @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                        @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                        @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];

    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++)
    {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }

    // Top Left Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.9;

    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
    // Top Right Animation
    UIImageView *slowAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 95, 86, 193)];
    slowAnimationImageView.animationImages = images;
    slowAnimationImageView.animationDuration = 0.9;
    
    [self.view addSubview:slowAnimationImageView];
    [slowAnimationImageView startAnimating];
    
    // Bottom Middle Animation
    UIImageView *middleAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 160, 86, 193)];
    middleAnimationImageView.animationImages = images;
    middleAnimationImageView.animationDuration = 0.9;
    
    [self.view addSubview:middleAnimationImageView];
    [middleAnimationImageView startAnimating];
    
    // For Audio
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/Gangnam Style (강남스타일).m4a",
                               [[NSBundle mainBundle] resourcePath]];
    NSLog(@"Path(STRING): %@", soundFilePath);
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    //    if (soundFilePath == nil)
    //    {
    //        NSLog(@"There is no soundFileURL");
    //    }
    //    else
    //    {
    //        NSLog(@"The soundFileURL is: %@", [soundFileURL absoluteString]);
    //    }
    
    NSError *error = nil;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    audioPlayer.numberOfLoops = -1;
    
    if (audioPlayer == nil)
    {
        NSLog(@"%@", [error description]);
    }
    else
    {
        [audioPlayer prepareToPlay];
        [audioPlayer play];
        //        NSLog(@"Should have been played.");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
