.global main
.section .text

main:
    sbi   0x0A, 4      ; DDRD bit 4 = OUTPUT (pin 4)
loop:
    sbi   0x0B, 4      ; PORTD bit 4 = HIGH (Relé ON)
    call  delay
    cbi   0x0B, 4      ; PORTD bit 4 = LOW (Relé OFF)
    call  delay
    rjmp  loop

delay:
    ldi   r18, 100     ; Ajusta este valor para el tiempo deseado
d1: ldi   r19, 255
d2: dec   r19
    brne  d2
    dec   r18
    brne  d1
    ret