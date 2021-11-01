%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher
    xor ebx, ebx; clean up ebx, in bl i will store the byte(char)

    ;PRINTF32 ` %d\n\x0`, edi
ex2:
    mov bl, byte [esi + ecx - 1] ;extrag un char
 
is_little:
    ;dc ajung aici pot continua
    cmp bl, 'a'
    jl is_big
    cmp bl, 'z'
    jg just_continue
    ;altfel e litera mica
    ;execut instructiunea de rotire dupa care jump la contiuare

    ;efectiva rotatie
  
    push ecx
    mov ecx, edi
    jmp rotate1

muta_pe_a:
    mov bl, 'a'
    dec ecx
    jmp rotate1

rotate1:
    cmp ecx, 0
    jle gata1
    inc bl
    cmp bl, 'z'
    jg muta_pe_a
    dec ecx
    jmp rotate1 ; altfel doar incrementez fiecare litera

gata1:
    pop ecx
    jmp just_continue

is_big:
    ;verific dc e litera mare
    cmp bl, 'A'
    jl just_continue
    cmp bl, 'Z'
    jg just_continue ; dc ajung aici inseama ca nu 
    ;e nici litera mica, nici mare semenele din [91, 96] - varianta in decimal
    ;altfel e litera mare si procede with the followings


    push ecx
    mov ecx, edi
    jmp rotate2

muta_pe_A:
    mov bl, 'A'
    dec ecx
    jmp rotate2

rotate2:
    cmp ecx, 0
    jle gata2
    inc bl
    cmp bl, 'Z'
    jg muta_pe_A
    dec ecx
    jmp rotate2 ; altfel doar incrementez fiecare litera

gata2:
    pop ecx
    jmp just_continue

    ;PRINTF32 `%d\x0`, ebx

just_continue:
    ;pun charul modificat sau nu in sirul destinatie
    mov byte [edx + ecx - 1], bl
    loop ex2

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY