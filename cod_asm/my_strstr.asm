%include "io.mac"

section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY
    ;; TO DO: Implement my_strstr

    ;PRINTF32 ` TEST\n\n\n%s\n\x0`, ebx 
    ;PRINTF32 ` TEST%d\n\n\n\x0`, edx 
    push edi
    push ecx ; parcurg haystack cu el
    push edx ; parcurg needle cu el
    xor eax, eax
    xor ecx, ecx
    xor edx, edx
    jmp verific

increment_both:
    inc edx
    
    inc ecx
    mov eax, [ebp + 24]
    ;PRINTF32 `aici am eax - lung needle %d\n\x0`, eax 
    ;PRINTF32 `cat are comun %d\n\x0`, edx 
    cmp eax, edx
    je found
    jmp verific ; altfel verific in continuare

inc_ecx:
    inc ecx
    xor edx, edx
    jmp verific

reset_edx:
    xor edx, edx
    jmp continue

verific:
    
    mov al, byte[esi + ecx]
    test al, al
    je not_found

    mov ah, byte[ebx + edx]
    test ah, ah
    jne continue
    je reset_edx

continue:

    cmp al, ah
    je increment_both
    jmp inc_ecx

found: ; e in ecx - edx
    mov eax, 77777
    ;PRINTF32 `   %d\n\x0 `, eax
    mov eax, ecx
    ;PRINTF32 `   %d\n\x0 `, eax
    sub eax, edx
    jmp restore

not_found:
    mov eax, [ebp + 20] ; len sir original
    inc eax ; la care se vrea a fi adaugat 1

restore:

    pop edx
    pop ecx
    pop edi

    mov [edi], eax ; pun rezultatul in edi(adresa maie exact - edi e o adresa)
    ;PRINTF32 `   %d\n\x0 `, [edi] 

    popa
    leave
    ret
    ;; DO NOT MODIFY
