#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
	NSFileHandle *stdOut = [NSFileHandle fileHandleWithStandardOutput];
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	[stdOut writeData:[pasteboard dataForPasteboardType:@"public.data"]];
	return 0;
}
