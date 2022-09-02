#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

void showUsage(const char *command) {
	printf(
		"Usage  : %s [--type <pasteboardType>]\n"
		"Example: seq 10|%s\n"
		"         %s --type public.png < image.png\n",
		command, command, command
	);
}

int main(int argc, char *argv[]) {
	NSFileHandle *stdIn = [NSFileHandle fileHandleWithStandardInput];
	NSMutableData *inputData = [NSMutableData dataWithCapacity:1000];
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	NSString *pasteboardType = @"public.plain-text";
	for (int i = 1; i < argc; i++) {
		if (strcmp(argv[i], "--type") == 0) {
			if (i + 1 >= argc) {
				showUsage(argv[0]);
				exit(1);
			}
			i++;
			pasteboardType = [[NSString alloc] initWithUTF8String:argv[i]];
		} else if (strcmp(argv[i], "--help") == 0) {
			showUsage(argv[0]);
			exit(0);
		}
	}
	while (1) {
		NSData *data = [stdIn availableData];
		if (data.length > 0) {
			[inputData appendData:data];
		} else {
			break;
		}
	}
	[pasteboard setData:inputData forPasteboardType:pasteboardType];
	return 0;
}
