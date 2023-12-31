SOURCE_DIR=.
RESCOMP = ../rescomp/target/rescomp.jar
BUILD_DIR = bin
CFG=../dclib/cfg/durango.cfg
DCLIB=../dclib/bin
DCINC=../dclib/inc

all: musica.dux

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/cinco_lobitos.h: cinco_lobitos.png $(BUILD_DIR)
	java -jar ${RESCOMP} -n cinco_lobitos -m BACKGROUND -i cinco_lobitos.png -o $(BUILD_DIR)/cinco_lobitos.h

$(BUILD_DIR)/cinco_lobitos_music.h: cinco_lobitos.musicxml $(BUILD_DIR)
	java -jar ${RESCOMP} -n cinco_lobitos_music -m MUSIC -i cinco_lobitos.musicxml -o $(BUILD_DIR)/cinco_lobitos_music.h

$(BUILD_DIR)/nana_music.h: nana.musicxml $(BUILD_DIR)
	java -jar ${RESCOMP} -n nana_music -m MUSIC -i nana.musicxml -o $(BUILD_DIR)/nana_music.h

$(BUILD_DIR)/alegria_music.h: himno_alegria.musicxml $(BUILD_DIR)
	java -jar ${RESCOMP} -n alegria_music -m MUSIC -i himno_alegria.musicxml -o $(BUILD_DIR)/alegria_music.h

$(BUILD_DIR)/main.s: $(SOURCE_DIR)/main.c $(BUILD_DIR) $(BUILD_DIR)/cinco_lobitos.h $(BUILD_DIR)/cinco_lobitos_music.h $(BUILD_DIR)/nana_music.h $(BUILD_DIR)/alegria_music.h
	cc65 -I $(DCINC) $(SOURCE_DIR)/main.c -t none --cpu 6502 -o $(BUILD_DIR)/main.s

$(BUILD_DIR)/main.o: $(BUILD_DIR)/main.s $(BUILD_DIR)
	ca65 -t none $(BUILD_DIR)/main.s -o $(BUILD_DIR)/main.o


$(BUILD_DIR)/musica.bin: $(BUILD_DIR) $(BUILD_DIR)/main.o
	ld65 -C $(CFG) $(BUILD_DIR)/main.o $(DCLIB)/glyph.lib $(DCLIB)/system.lib $(DCLIB)/psv.lib $(DCLIB)/music.lib $(DCLIB)/durango.lib -o $(BUILD_DIR)/musica.bin	

musica.dux: $(BUILD_DIR)/musica.bin
	java -jar ${RESCOMP} -m SIGNER -n $$(git log -1 | head -1 | sed 's/commit //' | cut -c1-8) -t "MUSICA INFANTIL" -d "Las canciones de siempre" -i $(BUILD_DIR)/musica.bin -o musica.dux

clean:
	rm -Rf $(BUILD_DIR) musica.bin
