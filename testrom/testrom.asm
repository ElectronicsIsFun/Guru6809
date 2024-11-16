******************************************************
*  testrom.asm                                       *
*  Written by: Carlos Santiago                       *
*  Date: August 8, 2023                              *
*                                                    *
*  Write values of $00-$FF starting at address $200  *
*  and ending at address $7fff (end of ram).         *   
*  Check the ram data and fail if it is wrong.       *
*  Otherwise, repeat forever.                        *       
******************************************************
            org     0
            setdp   0
endram      equ     $7fff

reset       equ     rom    set the reset vector to point to
            org     reset  the start of the program.
rom         equ     $c000
            org     rom    start of rom.    
start       lda     #$00
            ldx     #$0000
loop        sta     ,x      write data to ram.
            cmpa    ,x      is the ram data correct?
            bne     fail    no.
            inca
            leax    1,x     increment address.
            cmpx    endram  end of ram?
            ble     loop    yes.
            jmp     start
            
fail        jmp     fail  
            fill   $ff,$4000-$1b  pad the rom to 32k - the code size
            org $fffe   reset vector   
            FDB reset

            end start