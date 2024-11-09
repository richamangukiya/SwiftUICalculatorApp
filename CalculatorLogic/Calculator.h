//
//  Calculator.h
//  SwiftUICalculatorApp
//
//  Created by Richa Mangukiya on 11/8/24.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

- (double)add:(double)a with:(double)b;
- (double)subtract:(double)a with:(double)b;
- (double)multiply:(double)a with:(double)b;
- (double)divide:(double)a with:(double)b;
- (double)sine:(double)value;
- (double)cosine:(double)value;
- (double)tangent:(double)value;

@end
