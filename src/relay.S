.global main
.section .text

main:
    sbi   0x0A, 4      ; DDRD bit 4 = OUTPUT (pin 4)

loop:
    sbi   0x0B, 4      ; PORTD bit 4 = HIGH (Relé ON)
    rcall delay        ; espera
    cbi   0x0B, 4      ; PORTD bit 4 = LOW (Relé OFF)
    rcall delay        ; espera
    rjmp  loop

; ------------------------
; Rutina de retardo burdo
; ------------------------
delay:
    ldi   r18, 200     ; bucle externo grande
d1: ldi   r19, 255     ; bucle medio
d2: ldi   r20, 255     ; bucle interno
d3: dec   r20
    brne  d3
    dec   r19
    brne  d2
    dec   r18
    brne  d1
    ret
