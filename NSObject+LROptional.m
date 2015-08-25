// NSObject+LROptional.m
//
// Copyright (c) 2015 Luis Recuenco
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSObject+LROptional.h"

#import <objc/runtime.h>

#pragma mark - LRMessageDisposer

@interface LRMessageDisposer : NSObject
@end

@implementation LRMessageDisposer

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    class_addMethod(self, sel, imp_implementationWithBlock(^{}), nil);
    return YES;
}

@end

#pragma mark - LROptionalWrapper

@interface LROptionalWrapper : NSObject
@property (nonatomic, weak) NSObject *target;
@end

@implementation LROptionalWrapper

- (instancetype)initWithTarget:(id)target
{
    if (!(self = [super init])) return nil;
    _target = target;
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([self.target respondsToSelector:aSelector]) return self.target;
    else return [[LRMessageDisposer alloc] init];
}

@end

#pragma mark - NSObject (_LROptional)

@interface NSObject (_LROptional)
@property (readonly) LROptionalWrapper *lr_optionalWrapper;
@end

@implementation NSObject (_LROptional)

- (LROptionalWrapper *)lr_optionalWrapper
{
    LROptionalWrapper *optionalWrapper = objc_getAssociatedObject(self, _cmd);
    if (optionalWrapper) return optionalWrapper;

    optionalWrapper = [[LROptionalWrapper alloc] initWithTarget:self];
    objc_setAssociatedObject(self, _cmd, optionalWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return optionalWrapper;
}

@end

#pragma mark - NSObject (LROptional)

@implementation NSObject (LROptional)

- (id)lr_optional
{
    return self.lr_optionalWrapper;
}

@end
