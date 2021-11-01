%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the One Time Pad cipher

otp_ex:
    mov bl, byte [esi + ecx - 1]

    mov bh, byte [edi + ecx - 1]
    xor bl, bh
    mov byte [edx + ecx - 1], bl

    loop otp_ex

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY