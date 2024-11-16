******************************************************
*  bios.asm                                          *
*  Written by: Carlos Santiago                       *
*  Date: November 13, 2023                           *
*                                                    *
*  Bios will contain the basic input/output routines *
*  for performing general functions needed such as   *   
*  console write, keyboard read, initialization,     *
*  display mode settings, storage functions, sound   *    
*  settings, sprite engine control, graphics         *
*  primatives (set pixel, line draw, area fill, etc).*   
*                                                    *
******************************************************

            org     0
            setdp   0
startram    equ     $0000
endram      equ     $7fff
* Memory mapped I/O is defined as:
iocs0       equ     $FF00   IOCS0 decode $FF00-$FF0F
iocs1       equ     $FF10   IOCS0 decode $FF10-$FF1F
iocs2       equ     $FF20   IOCS0 decode $FF20-$FF2F
iocs3       equ     $FF30   IOCS0 decode $FF30-$FF3F
allram      equ     $FFC0   Memory map control set allram mode
romram      equ     $FFC1   Memory map control set  romram mode (default at reset)
vga_kbd     equ     $FFC2   Chipselect for VGA and Keyboard
st_snd      equ     $FFC3   Chipselect for Storage and Sound
FFC4        equ     $FFC4   General Chipselect for bus device
FFC5        equ     $FFC5   General Chipselect for bus device
FFC6        equ     $FFC6   General Chipselect for bus device
FFC7        equ     $FFC7   General Chipselect for bus device

reset       equ     rom    set the reset vector to point to
            org     reset  the start of the program.
rom         equ     $8000
            org     rom    start of rom.

******************************************************
*  Initialization code                               *
*  Setup system tables for drivers                   *
*  initialize zero page parameters                   *
*  define keyboard buffer                            *
******************************************************


******************************************************
*  Setup a redirection table for all logical devices *
*                                                    *
*  Integrated Logical devices:                       *
*                                                    *
*  con: Console (text and keyboard)                  *
*  gfx: Graphics Engine (VGA)                        *
*  snd: Sound Engine                                 *
*  sto: Storage (SD-CARD)                            *
*  spr: Sprite Engine                                *
*  joy: Joysticks
*  vc1: virtual comm port 1 (vga_kbd PICO USB)       *
*  vc2: virtual comm port 2 (st_snd PICO USB)        *
*                                                    *
*  External/Bus devices:                             *
*                                                    *
*  io0: Device on iocs0                              *
*  io1: Device on iocs1                              *
*  io3: Device on iocs2                              *
*  io3: Device on iocs3                              *
*                                                    *
******************************************************
*  Integrated logical device drivers reside in the   *
*  bios. The drivers for these logical devices can   *
*  be replaced with user provided drivers changing   *
*  the address in this table with the address of the *
*  new driver provided. This allows the user to add  *
*  new hardware that replaces the integrated hardware*
*  in the system. When new hardware is added the     *
*  address of the new driver can replace the io0 to  *
*  io3 device addresses in this table.               *
******************************************************

******************************************************
* Initialize console                                 *
******************************************************


******************************************************
* Console write                                      *
******************************************************


******************************************************
* Initialize keyboard                                *
******************************************************


******************************************************
* Keyboard read character                            *
******************************************************


******************************************************
* Keyboard raw read scan code                        *
******************************************************


******************************************************
* Keyboard write led (capslock, numlock,  )          *
******************************************************


******************************************************
* Initialize Graphics Engine                         *
******************************************************


******************************************************
* Initialize Sound Engine                            *
******************************************************


******************************************************
* Initialize Storage                                 *
******************************************************


******************************************************
* Initialize Sprite Engine                           *
******************************************************


******************************************************
* Initialize Joysticks                               *
******************************************************


******************************************************
* Initialize Virtual comm port 1                     *
******************************************************


******************************************************
* Initialize Virtual comm port 2                     *
******************************************************


            fill   $ff,$4000-$1b  pad the rom to 32k - the code size
            org $fffe   reset vector   
            FDB reset

            end start



