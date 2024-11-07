.intel_syntax noprefix
.global quicksort_asm

.text

// array -> rdi  
// low -> rsi  
// high -> rdx  

// pivot -> rax
// i -> r9
// j -> r10

// temp -> rcx

quicksort_asm:
    cmp rsi, rdx 
    jge done

    mov eax, [rdi + rsi * 4]

    mov r9, rsi 
    dec r9

    mov r10, rdx
    inc r10

outer_loop:
    inner_loop1:
        inc r9
        mov ecx, [rdi + r9 * 4]
        cmp ecx, eax
        jl inner_loop1

    inner_loop2:
        dec r10
        mov ecx, [rdi + r10 * 4]
        cmp ecx, eax
        jg inner_loop2

    cmp r9, r10
    jge inner_done

    mov ecx, [rdi + r9 * 4]
    mov r11d, [rdi + r10 * 4]
    mov dword ptr [rdi + r9 * 4], r11d
    mov dword ptr [rdi + r10 * 4] , ecx
    
    jmp outer_loop

inner_done:
    push rdi
    push rsi
    push rdx
    push r10
    push rcx
    mov rdx, r10
    call quicksort_asm
    pop rcx
    pop r10
    pop rdx
    pop rsi
    pop rdi

    push rdi
    push rsi
    push rdx
    push r10
    push rcx
    inc r10
    mov rsi, r10
    call quicksort_asm
    pop rcx
    pop r10
    pop rdx
    pop rsi
    pop rdi


done:
    ret

