/*!
 @class UIColor+extensions.m
 
 @author Matthew Inman
 
 @copyright 2013 (c). Popeye Development Limited
 
 This library is to be used as is and can be used free of charge. Please use at your own risk.
 */

#import "UIColor+extensions.h"

@implementation UIColor (extensions)

+ (UIColor *)colorWithHex:(NSString *)hexStr
{
    return [[self class] colorWithHex:hexStr alpha:1.0f];
}

+ (UIColor *)colorWithHex:(NSString *)hexStr alpha:(CGFloat)alpha
{
    NSString *removedHashStr = [hexStr stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([removedHashStr length] == 3)
        removedHashStr = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                          [removedHashStr substringWithRange:NSMakeRange(0, 1)],
                          [removedHashStr substringWithRange:NSMakeRange(0, 1)],
                          [removedHashStr substringWithRange:NSMakeRange(1, 1)],
                          [removedHashStr substringWithRange:NSMakeRange(1, 1)],
                          [removedHashStr substringWithRange:NSMakeRange(2, 1)],
                          [removedHashStr substringWithRange:NSMakeRange(2, 1)]];
    
    if([removedHashStr length] == 6)
        removedHashStr = [removedHashStr stringByAppendingString:@"ff"];
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:removedHashStr] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CAGradientLayer *)colorWithGradientForTop:(id)topClr bottom:(id)bottomClr frame:(CGRect)frame
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    [layer setFrame:frame];
    [layer setColors:[NSArray arrayWithObjects:
                        (id)[topClr CGColor],
                        (id)[bottomClr CGColor], nil]];
    [layer setStartPoint:CGPointMake(0.5f, 0.0f)];
    [layer setEndPoint:CGPointMake(0.5f, 1.0f)];
    return layer;
}

+ (UIImage *)colorWithGradientImageForTop:(id)topClr bottom:(id)bottomClr frame:(CGRect)frame
{
    CAGradientLayer *layer = [self colorWithGradientForTop:topClr bottom:bottomClr frame:frame];
    UIGraphicsBeginImageContext([layer frame].size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIColor *)colorWithGradientColorForTop:(id)topClr bottom:(id)bottomClr frame:(CGRect)frame
{
    CAGradientLayer *layer = [self colorWithGradientForTop:topClr bottom:bottomClr frame:frame];
    UIGraphicsBeginImageContext([layer frame].size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [self colorWithPatternImage:image];
}

+ (UIColor *)auburnColor
{
    return [self colorWithHex:@"a52a2a"];
}

+ (UIColor *)awesomeColor
{
    return [self colorWithHex:@"ff2052"];
}

+ (UIColor *)ashColor
{
    return [self colorWithHex:@"#b2beb5"];
}

+ (UIColor *)beigeColor
{
    return [self colorWithHex:@"#f5f5dc"];
}

+ (UIColor *)blondColor
{
    return [self colorWithHex:@"#faf0be"];
}

+ (UIColor *)blushColor
{
    return [self colorWithHex:@"#de5d83"];
}

+ (UIColor *)boneColor
{
    return [self colorWithHex:@"#e3dac9"];
}

+ (UIColor *)bubbleGumColor
{
    return [self colorWithHex:@"#ffc1cc"];
}

+ (UIColor *)chocolateColor
{
    return [self colorWithHex:@"#d2691e"];
}

+ (UIColor *)champagneColor
{
    return [self colorWithHex:@"#fad6a5"];
}

+ (UIColor *)coffeeColor
{
    return [self colorWithHex:@"#6f4e37"];
}

+ (UIColor *)copperColor
{
    return [self colorWithHex:@"#b87333"];
}

@end