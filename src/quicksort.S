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
    push rdx                            // Save original high value
    push r10                            // Save partition boundary j for left partition
    mov rdx, r10                        // Set high to j for the left partition call
    call quicksort_asm                  // Recursive call for the left partition
    pop r10                             // Restore j for use in the second recursive call 
    pop rdx                             // Restore original high for use in the second recursive call

    push rdx                            // Save high again for right partition call
    lea rsi, [r10 + 1]                  // Set low to j + 1 for the right partition
    call quicksort_asm                  // Recursive call for the right partition
    pop rdx                             // Restore original high value

done:
    ret

