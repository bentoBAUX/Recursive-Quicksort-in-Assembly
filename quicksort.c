#include <stdio.h>

extern void sort(int *array, size_t count);                     // For one uni assignment exercise
extern void quicksort_asm(int *array, size_t low, size_t high); // For another uni assignment exercise
void quicksort_c(int *array, size_t low, size_t high);          // For my own reference

int main()
{
    int arrayC[] = {53, 87, 22, 45, 9, 78, 32, 14, 68, 23};
    int arrayASM[] = {53, 87, 22, 45, 9, 78, 32, 14, 68, 23};
    int lengthC = sizeof(arrayC) / sizeof(arrayC[0]);
    int lengthASM = sizeof(arrayASM) / sizeof(arrayASM[0]);

    printf("C: ");

    quicksort_c(arrayC, 0, lengthC - 1);

    for (int i = 0; i < lengthC; i++)
    {
        printf("%d ", arrayC[i]);
    }

    printf("\n");

    printf("ASM Sort: ");
    sort(arrayASM, sizeof(arrayASM)/sizeof(arrayASM[0]));
    for (int i = 0; i < lengthASM; i++)
    {
        printf("%d ", arrayASM[i]);
    }

    printf("\n");

    printf("ASM Quicksort: ");
    quicksort_asm(arrayASM, 0, lengthASM - 1);
    for (int i = 0; i < lengthASM; i++)
    {
        printf("%d ", arrayASM[i]);
    }

    printf("\n");

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