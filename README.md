# basicOS
building my own, basic, operating system. written in C and x86. proof-of-concept project, not affiliated with my university in any way. 

most of the actual contents are located in the `os` directory, all the others are smaller steps that were worked through on my way to 
having a complete, functional operating system. 

making this system work required constructing an architecture-compatible cross-compiler gcc compiler. this won't work on your system 
unless you also construct one, using an i386-elf architecture mode. you can do all of this through gnu.org, but it's a tricky process
