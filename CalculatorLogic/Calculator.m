//
//  Calculator.m
//  CalculatorLogic
//
//  Created by Richa Mangukiya on 11/8/24.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import <math.h>

@implementation Calculator

- (double)add:(double)a with:(double)b {
    return a + b;
}

- (double)subtract:(double)a with:(double)b {
    return a - b;
}

- (double)multiply:(double)a with:(double)b {
    return a * b;
}

- (double)divide:(double)a with:(double)b {
    return b != 0 ? a / b : 0;
}

- (double)sine:(double)value {
    return sin(value);
}

- (double)cosine:(double)value {
    return cos(value);
}

- (double)tangent:(double)value {
    return tan(value);
}

@end
