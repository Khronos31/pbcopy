package main

/*
#cgo LDFLAGS: -framework Foundation -framework UIKit
#cgo CFLAGS: -ObjC

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

int Main(int argc, char *argv[]);

int Main(int argc, char *argv[]) {
	NSFileHandle *stdOut = [NSFileHandle fileHandleWithStandardOutput];
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	[stdOut writeData:[pasteboard dataForPasteboardType:@"public.data"]];
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
