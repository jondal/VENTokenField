// VENBackspaceTextField.m
//
// Copyright (c) 2014 Venmo
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

#import "VENBackspaceTextField.h"

@implementation VENBackspaceTextField

- (void)deleteBackward {
    BOOL shouldDelete = (self.text.length == 0);

    [super deleteBackward];
    
    if (shouldDelete) {
        if ([self.backspaceDelegate respondsToSelector:@selector(textFieldDidEnterBackspace:)]) {
            [self.backspaceDelegate textFieldDidEnterBackspace:self];
        }
    }
}

// This method should only be used for iOS versions 8.0 - 8.2.
- (BOOL)keyboardInputShouldDelete:(UITextField *)textField {
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];

    if (version > 7.9 && version < 8.3) {
        [self deleteBackward];
    }

    return YES;
}

@end
