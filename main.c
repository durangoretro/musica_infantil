#include <system.h>
#include <glyph.h>
#include <font.h>
#include <music.h>
#include "bin/cinco_lobitos_music.h"

int main() {
	char number;

	do {
		clear_screen();
		printStr(10, 50, font, WHITE, BLACK, "Pulsa un numero...");
		number=getchar();
		if(number=='1') {
			clear_screen();
			printStr(10, 50, font, WHITE, BLACK, "1");
			playMelody(&cinco_lobitos_music);
		}
	
	} while(1);	
	return 0;
}
