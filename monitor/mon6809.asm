********************************************************
*  mon6809.asm                                         *
*  Written by: Carlos Santiago                         *
*  Date: November 13, 2023                             *
*                                                      *
*  mon6809 is a monitor program that provides commands *
*  for examining and modifying memory. Display of      *
*  registers, stepping through code, loading and       *
*  saving code, dumping memory.                        *   
*                                                      *
********************************************************

            org     0
            setdp   0
startram    equ     $0000
endram      equ     $7fff

reset       equ     rom    set the reset vector to point to
            org     reset  the start of the program.
rom         equ     $8000  Start of bios code
            org     rom    start of rom.
* Bios code starts here.

mon         equ     $c000  This address will point to the
*                          start of the monitor
********************************************************
*  Initilaize monitor                                  *
********************************************************
start 	    nop             Monitor entry point


********************************************************
*  Parser                                              *
********************************************************

********************************************************
*  Storage                                             *
********************************************************

********************************************************
*  Read data from storage                              *
********************************************************

********************************************************
*  Write data to storage                               *
********************************************************

********************************************************
* Modify Memory                                        *
********************************************************

********************************************************
* Fill memory block                                    *
********************************************************

********************************************************
* Dump Memory                                          *
********************************************************

********************************************************
* Display registers                                    *
********************************************************

********************************************************
* Step code                                            *
********************************************************

********************************************************
*  Set breakpoint(s)                                   *
********************************************************

********************************************************
*  Clear breakpoint(s)                                 *
********************************************************

********************************************************
*  Run code                                            *
********************************************************


            fill   $ff,$4000-$1b  pad the rom to 32k - the code size
            org $fffe   reset vector   
            FDB reset

            end start