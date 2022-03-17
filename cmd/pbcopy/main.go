package main

/*
#cgo LDFLAGS: -framework Foundation -framework UIKit
#cgo CFLAGS: -ObjC

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

int Main(int argc, char *argv[]);

int Main(int argc, char *argv[]) {
	NSFileHandle *stdIn = [NSFileHandle fileHandleWithStandardInput];
	NSError *stdinError = nil;
	NSMutableData *inputData = [NSMutableData dataWithCapacity:1000];
	while(1) {
		NSData *data = [stdIn availableData];
		if(data.length > 0) {
			[inputData appendData:data];
		} else {
			break;
		}
	}
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	[pasteboard setData:inputData forPasteboardType:@"public.plain-text"];
	return 0;
}
*/
import "C"

import (
    "os"
    "unsafe"
)

func main() {
	argc := C.int(len(os.Args))
	argv := make([]*C.char, argc)
	for i, arg := range os.Args {
	    argv[i] = C.CString(arg)
	}
	C.Main(argc, (**C.char)(unsafe.Pointer(&argv[0])))
}
