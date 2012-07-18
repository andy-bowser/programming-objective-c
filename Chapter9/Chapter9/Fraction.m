//
//  Fraction.m
//  Chapter9
//
//  Created by Nicholas Squire on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(void) print {
    NSLog (@"%i/%i", numerator, denominator); 
}

-(double) convertToNum 
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}

-(void) setTo: (int) n over: (int) d 
{
    numerator = n;
    denominator = d; 
}

// add a Fraction to the receiver
-(id) add: (id) f
{
    // To add two fractions:
    // a/b + c/d = ((a*d) + (b*c)) / (b * d)
    // result will store the result of the addition 
    
    id result = [[Fraction alloc] init];
    
    [result setNumerator: numerator * [f denominator] + denominator * [f numerator]]; 
    [result setDenominator: denominator * [f denominator]];
    [result reduce];
    
    return result;
}

-(void) reduce {
    int u = numerator; 
    int v = denominator; 
    int temp;
    
    while (v != 0) { 
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u; 
}

@end
