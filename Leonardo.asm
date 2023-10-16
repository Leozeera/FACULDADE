;Programa Soma de dois numeros de 1 digito 
;Introdução ao Assembly
;Author: Leonardo, FEAP 
;Version Leonardo Luz Moises, curso Engenharia da Computação
SYS_EXIT    equ 1 
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .data       ;seção de dados iniciado
                    ;chamada (mensagem) para informar 10 numero
    msg1 db 'Insira um digito',0xa, 0xd
    len1 equ $ - msg1
                    ;chamada (mensagem) para informar 20 numero
    msg2 db 'Insira o segundo digito', 0xa, 0xd
    len2 equ $ - msg2
                    ;chamada (mensagem) para informar resultado (soma)
    msg3 db 'A soma e: '
    len3 equ $ - msg3
    
section .bss        ;seção de declaração de variaveis a serem processados
    num1 resb 2
    num2 resb 2
    res  resb 2
    
section .text       ;seção de execução
    global _start
    
_start:              ;iniciando progração 

                    ;imprime a string msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0X80
                    ;le o primeiro numero 
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1 
    mov edx, 2
    int 0x80
                    ;imprime a string msg2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80
                    ;le o segundo numero
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80 

;move o primeiro numero para o registro eax e subtral o ASCII 0 para converter pro DEC (decimal)
    mov eax, [num1]
    sub eax, '0'
    
;move o segundo numero para o registro ebx e subtral o ASCII 0 para converter pro DEC (decimal)
    mov ebx , [num2]
    sub ebx, '0'

    ;soma eax e abx 
    add eax, ebx
    
    ;adicione '0' para converter de decimal para ASCII
    add eax, '0'
    
    ;amazenar o soma da localização de memória 'res'
    mov [res], eax

    ;imprime a string msg3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3 
    int 0x80 
    
    ;imprime o resultado 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res 
    mov edx, 2 
    int 0x80    
    
    ; Termina o programa
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
