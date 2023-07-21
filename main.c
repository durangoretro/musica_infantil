#include <system.h>
#include <glyph.h>
#include <font.h>
#include <music.h>
#include "bin/cinco_lobitos_music.h"
#include "bin/cinco_lobitos.h"

const unsigned char nana_music[26] = {
MI4,      CORCHEA, MI4, CORCHEA, SOL4, NEGRAP,  MI4, CORCHEA, MI4, NEGRA, 
SOL4,     NEGRA,   MI4, CORCHEA, SOL4, CORCHEA, DO5, NEGRA,   SI4, NEGRA,
SILENCIO, CORCHEA, LA4, CORCHEA, 0xFF, 0xFF
};

int main() {
	char number;

	do {
		clear_screen();
		printStr(10, 50, font, WHITE, BLACK, "Pulsa un numero...");
		number=getchar();
		if(number=='1') {
			clear_screen();
			printStr(10, 50, font, WHITE, BLACK, "Nana de Brahms");
			playMelody(&nana_music);
		}
		if(number=='2') {
			clear_screen();
			draw_image(&cinco_lobitos);
			playMelody(&cinco_lobitos_music);
		}
	
	} while(1);	
	return 0;
}
