#include <stdio.h>

extern void quicksort_asm(int *array, size_t low, size_t high); 
void quicksort_c(int *array, size_t low, size_t high);          

void printarray(int* array, size_t length);

int main()
{
    int arrayC[] = {53, 87, 22, 45, 9, 78, 32, 14, 68, 23};
    int arrayASM[] = {53, 87, 22, 45, 9, 78, 32, 14, 68, 23};

    int lengthC = sizeof(arrayC) / sizeof(arrayC[0]);
    int lengthASM = sizeof(arrayASM) / sizeof(arrayASM[0]);

    printf("C: ");
    quicksort_c(arrayC, 0, lengthC - 1);
    printarray(arrayC, lengthC);

    printf("ASM Quicksort: ");
    quicksort_asm(arrayASM, 0, lengthASM - 1);
    printarray(arrayASM, lengthASM);

    return 0;
}

void quicksort_c(int *array, size_t low, size_t high)
{
    if (low >= high)
    {
        return;
    }
    int pivot = array[low];
    int i = low - 1;
    int j = high + 1;
    while (1)
    {
        do
        {
            i++;
        } while (array[i] < pivot);

        do
        {
            j--;
        } while (array[j] > pivot);

        if (i >= j)
        {
            break;
        }
        int temp = (int)array[i];
        array[i] = (int)array[j];
        array[j] = temp;
    }

    quicksort_c(array, low, j);
    quicksort_c(array, j + 1, high);
}

void printarray(int* array, size_t length){
    for (size_t i = 0; i < length; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}