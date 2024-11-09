.intel_syntax noprefix
.global sort

.text

// count -> rsi

// array -> rdi  
// low -> rsi = 0  
// high -> rdx  

// pivot -> rax
// i -> r9
// j -> r10

// temp -> rcx


sort:
    test rsi, rsi 
    jle done
    dec rsi
    xor rdx, rdx
    mov rdx, rsi
    xor rsi, rsi

quicksort:
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
        mov ecx, [rdi + r9 * 4]         // Temp for A[i]
        cmp ecx, eax
        jl inner_loop1

    inner_loop2:
        dec r10
        mov ecx, [rdi + r10 * 4]        // Temp for A[j]
        cmp ecx, eax
        jg inner_loop2

    cmp r9, r10
    jge inner_done

    mov ecx, [rdi + r9 * 4]             // Temp for A[i]
    mov r11d, [rdi + r10 * 4]           // Temp for A[j]
    mov dword ptr [rdi + r9 * 4], r11d  // A[i] = A[j]
    mov dword ptr [rdi + r10 * 4] , ecx // A[j] = A[i]
    
    jmp outer_loop

inner_done:
    push rdx
    push r10
    mov rdx, r10
    call quicksort
    pop r10
    pop rdx

    push rdx
    lea rsi, [r10 + 1]
    call quicksort
    pop rdx


done:
    ret

