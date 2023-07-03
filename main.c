#include <system.h>
#include <glyph.h>
#include <font.h>
#include <music.h>
#include "bin/cinco_lobitos_music.h"
#include "bin/cinco_lobitos.h"

int main() {
	char number;

	do {
		clear_screen();
		printStr(10, 50, font, WHITE, BLACK, "Pulsa un numero...");
		number=getchar();
		if(number=='1') {
			clear_screen();
			draw_image(&cinco_lobitos);
			playMelody(&cinco_lobitos_music);
		}
	
	} while(1);	
	return 0;
}
