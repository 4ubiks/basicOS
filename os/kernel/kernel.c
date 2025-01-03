#include "../drivers/screen.h"
#include "util.h"

int main(){
	//char* video_memory = (char*) 0xb8000;
	//*video_memory = 'X';
	clear_screen();


	int i=0;
	for (i=0; i < 24; i++){
		char str[255];
		int_to_ascii(i, str);
		kprint_at(str, 1, i);
	}

	kprint_at("This text forces the kernel to scroll. Row 0 will disappear. ", 60, 24);
	kprint("With this text, the kernel will scroll again, making row 1 also disappear");
	
	return 0;
}
