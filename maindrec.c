#include <stdio.h>
#include "NumClass.h"
int main(){
	int num1;
	int num2;
	printf("Please insert two natural numbers\n");
	scanf("%d %d", &num1, &num2);
	int min,max;
	if(num1>num2){
		min=num2;
		max=num1;
	}
	else{
		min=num1;
		max=num2;
	}
	printf("The Armstrong numbers are:");
	for(int i=min;i<max;i++){
		if(isArmstrongRecursion(i)){
			printf(" %d", i);
		}
	}
	printf("\nThe Palindromes are:");
	for(int i=min;i<max;i++){
		if(isPalindromeRecursion(i)){
			printf(" %d", i);
		}
	}
	printf("\nThe Prime numbers are:");
	for(int i=min;i<max;i++){
		if(isPrime(i)){
			printf(" %d", i);
		}
	}
	
	printf("\nThe Strong numbers are:");
	for(int i=min;i<max;i++){
		if(isStrong(i)){
			printf(" %d", i);
		}
	}
	
	printf("\n");
}
