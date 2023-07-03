#include <system.h>
#include <glyph.h>
#include <font.h>

int main() {
	char number;

	do {
		clear_screen();
		printStr(10, 50, font, WHITE, BLACK, "Pulsa un numero...");
		number=getchar();
		if(number=='1') {
			clear_screen();
			printStr(10, 50, font, WHITE, BLACK, "1");
			waitFrames(50);
		}
	
	} while(1);	
	return 0;
}
