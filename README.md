# Recursive Quicksort in Assembly

This project demonstrates the Quicksort algorithm implemented in both C and Assembly to explore performance and structural differences between high-level and low-level programming languages.

## Pseudocode
```c
quicksort(array, low, high):
    if low >= high:
        return

    pivot = array[low]
    i = low - 1
    j = high + 1

    while true:
        do
            i = i + 1
        while array[i] < pivot

        do
            j = j - 1
        while array[j] > pivot

        if i >= j:
            break

        temp = array[i]
        array[i] = array[j]
        array[j] = temp

    quicksort(array, low, j)         // Elements < pivot
    quicksort(array, j + 1, high)    // Elements >= pivot
```

## Project Structure
- src/: Contains the source files for both the C and Assembly implementations of Quicksort.
- Makefile: Handles compilation for both implementations. Run `make` to compile, then `make run` to execute.
