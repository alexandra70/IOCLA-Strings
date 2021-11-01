%include "io.mac"

section .text
    global bin_to_hex
    extern printf

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY

    push ecx
    push edx

    mov eax, ecx
    xor ecx, ecx
    xor edi, edi ; merg prin stringul destinatie
    xor bh, bh
    xor bl, bl
    xor dl, dl
    xor dh, dh

    dec eax ;incept de la lung string - 1 (de acolo am lucruri valide)
    jmp grupare

zero_char:
    mov cl, '0'
    jmp translatare_hex
one_char:
    mov cl, '1'
    jmp translatare_hex
two:
    mov cl, '2'
    jmp translatare_hex
three:
    mov cl, '3'
    jmp translatare_hex
four:
    mov cl, '4'
    jmp translatare_hex
five:
    mov cl, '5'
    jmp translatare_hex
six:
    mov cl, '6'
    jmp translatare_hex
seven:
    mov cl, '7'
    jmp translatare_hex
eight:
    mov cl, '8'
    jmp translatare_hex
nine:
    mov cl, '9'
    jmp translatare_hex
ten:
    mov cl, 'A'
    jmp translatare_hex
eleven:
    mov cl, 'B'
    jmp translatare_hex
twelve:
    mov cl, 'C'
    jmp translatare_hex
thirteen:
    mov cl, 'D'
    jmp translatare_hex
fourteen:
    mov cl, 'E'
    jmp translatare_hex
fifteen:
    mov cl, 'F'
    jmp translatare_hex

ce_litera:
    ;PRINTF32 `ttttttttttttt%hhu\n\x0`, ebx
    cmp cl, 0
    je zero_char
    cmp cl, 1
    je one_char
    cmp cl, 2
    je two
    cmp cl, 3
    je three
    cmp cl, 4
    je four
    cmp cl, 5
    je five
    cmp cl, 6
    je six
    cmp cl, 7
    je seven
    cmp cl, 8
    je eight
    cmp cl, 9
    je nine
    cmp cl, 10
    je ten
    cmp cl, 11
    je eleven
    cmp cl, 12
    je twelve
    cmp cl, 13
    je thirteen
    cmp cl, 14
    je fourteen
    cmp cl, 15
    je fifteen
    jmp translatare_hex ; nu cred ca are cum sa ajunga aici

refresh_bh:
    
    mov edx, [ebp + 8]
    jmp ce_litera
translatare_hex:
    mov byte [edx + edi], cl
    inc edi
    xor dh, dh
    xor cx, cx
    xor bh, bh
    cmp eax, 0
    jl final
    jmp grupare

e_zero_sau_unu:
    cmp bl, 49
    je one
    jmp zero
one:
    mov bl, 1
    jmp dupa_procesare_bit
zero:
    mov bl, 0
    jmp dupa_procesare_bit

grupare:
    cmp eax, 0
    jl refresh_bh
    xor bl, bl
    mov bl, byte[esi + eax]

    cmp bh, 3
    jg refresh_bh
    jmp e_zero_sau_unu

dupa_procesare_bit:
    mov dl, bh

shift:
    cmp dl, 0
    je gata_shift
    shl bl, 1
    dec dl
    jmp shift

gata_shift:

    add dh, bl ; in dh am efectiv numarul (e oricum pe 4 biti)
    xor ecx, ecx
    mov cl, dh
    ;am procesat charul trec mai depate
    dec eax
    ;PRINTF32 `string mic unde : %hhd\n\x0`, ecx
    inc bh ; increment prin grupuri de maxim patru biti
    jmp grupare

out:
    ;daca mai am ceva in cl - procesez acum
    ;nu stiu cum sa fac sa fie mai uniform in functiile de mai sus
    ;situatia urm se intampla numai in cazul in care nu am un numar de 
    ;biti divizibil cu 4 si astfel voi ramane cu un grup incomplet  ;care evident trebuie si el procesat, deci
   
    PRINTF32 `eax : %hhd\n\x0`, eax
    PRINTF32 `edi : %hhd\n\x0`, edi

    mov bl, [esi + eax]
    test bl, bl
    je refresh_bh

reverse_string:
    xor edx, edx

inner_loop:

    mov bl, byte[esi + edx]
    sub eax, 1
    mov bh, byte[esi + eax]
    mov byte [esi + eax], bl
    mov byte [esi + edx], bh
    inc edx
    cmp edx, ecx
    je leave_for_good
    jmp inner_loop

final:
    pop edx ; stringul in hex
    pop ecx ; len
    ;PRINTF32 `  edi?>>> : %d\n\x0`, edi
    mov eax, edi
    mov ecx, edi
    shr ecx, 1 ; merg pana la jumatatea stringului
    mov esi, edx
    jmp reverse_string

    ;; TODO: Implement bin to hex

leave_for_good:
   
   ;edi - cate grupuri de biti am facut - adica efectiv lungimea sirului
    mov byte [esi + edi], 0x0A ; la sfarsit pun characterul line feed

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY