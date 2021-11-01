%include "io.mac"


section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY

    ;PRINTF32 ` %s\n\x0`, edi
   
    ;mov byte[edx], 'x'
    ;PRINTF32 ` %d\n\x0`, edx

    
    push edx
    push esi
    push ecx
    push edi
    push ebx ; for checking the bytes of plaintext

    xor ecx, ecx ; used for key (- efectiva parcuregere a sirului -)
    xor eax, eax ; used for plain text
    jmp execute

reset_key:
    xor ecx, ecx
    jmp rot_me

is_litte:
    cmp bl, 'a'
    jl is_big
    cmp bl, 'z'
    jg ignore
    ;dc e litera mica ramane aici
    jmp rot_me

is_big:
    cmp bl, 'A'
    jl ignore
    cmp bl, 'Z'
    jg ignore
    jmp rot_me

ignore:
    ;dc nu e litera mica ;dc nu e nici mare  ;atunci fa ce e mai jos
    mov byte[edx + eax], bl
    cmp eax, [ebp + 16]
    je gata
    inc eax
    jmp execute

execute:
    mov bl, byte[esi + eax]
    ;verific sa vad dc am ajuns la final
    test bl, bl
    jmp is_litte ; sar sa vad dc e mica, se vor declansa si urm jmpuri
    ;jmp is_big
    ;jmp ignore

    ;daca nu am ajuns la finalul plain-text verific unde sunt in key
rot_me:
    
    mov bh, byte [edi + ecx]
    test bh, bh ; dc sunt la final, iau cheia de la inceput
    je reset_key

    push eax
    xor eax, eax
    jmp nr_rotatii

z_mare:
    sub bl, 26
    jmp Z

minus_tsix:
    sub bl, 26
    dec bh
   
nr_rotatii:
    cmp bh, 'A'
    jle out

    ;deci rotesc 
    cmp bl, 'Z' ;trebuie rotit ceva ce e pe Z
    je z_mare

Z:
    inc bl
    cmp bl, 'z'
    jg minus_tsix

    inc eax
    dec bh
    jmp nr_rotatii

out:
    pop eax
    mov byte[esi + eax], bl
    mov byte [edx + eax], bl
 
    inc eax
    inc ecx
    ;mov byte[edx + 3], 'h'
    jmp execute

gata:
    ;PRINTF32 ` %d\n\x0`, edx
    xor eax, eax
    mov eax, esi
    
    pop ebx
    pop edi
    pop ecx
    pop esi
    pop edx
   ; PRINTF32 ` edx - - - > %s\n\x0`, edx

    ;; TODO: Implement the Vigenere cipher

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY