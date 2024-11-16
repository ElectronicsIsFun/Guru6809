******************************************************
*  diag.asm                                          *
*  Written by: Carlos Santiago                       *
*  Date: November 13, 2024                           *
*                                                    *
*  This diagnostic will test the Guru6809 computer.  *
*  All ram and I/O decoding will be exercised.       *   
*                                                    *
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
* Memory test (simple)                               *
* Test ram from startram to endram using values from *
* $00 to $FF. Test will fails values written do not  *
* match when read.                                   *
****************************************************** 
start       lda     #$00
            ldx     startram
loop        sta     ,x      write data to ram.
            cmpa    ,x      is the ram data correct?
            bne     fail    no.
            inca
            leax    1,x     increment address.
            cmpx    endram  end of ram?
            ble     loop    yes.
******************************************************
*  Drive each I/O chipselect                         *  
******************************************************
iocstst	    lda     #$00
            ldx     iocs0   drive iocs0 
	    sta     ,x  
	    ldx     iocs1   drive iocs1
	    sta     ,x  
	    ldx     iocs2   drive iocs2
	    sta     ,x  
	    ldx     iocs3   drive iocs3
	    sta     ,x  

******************************************************
*  Drive vga and keyboard chipselect                 *  
******************************************************
vgaktst	    lda     #$00
            ldx     vga_kbd    
	    sta     ,x      drive vga_key
******************************************************
*  Drive storage and sound chipselect                *  
******************************************************
stsdtst     lda     #$00
            ldx     st_snd    
	    sta     ,x      drive st_snd
******************************************************
*  Drive general chipselect FFC4                     *  
******************************************************
ffc4tst     lda     #$00
            ldx     FFC4    
	    sta     ,x      drive FFC4
******************************************************
*  Drive general chipselect FFC5                     *  
******************************************************
ffc5tst     lda     #$00
            ldx     FFC5    
	    sta     ,x      drive FFC5
******************************************************
*  Drive general chipselect FFC6                     *  
******************************************************
ffc6tst     lda     #$00
            ldx     FFC6    
	    sta     ,x      drive FFC6
******************************************************
*  Drive general chipselect FFC7                     *  
******************************************************
ffc7tst     lda     #$00
            ldx     FFC7    
	    sta     ,x      drive FFC7


            jmp     start
            
fail        jmp     fail  
            fill   $ff,$4000-$1b  pad the rom to 32k - the code size
            org $fffe   reset vector   
            FDB reset

            end start