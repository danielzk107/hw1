#include <stdio.h>
#include "Functions.h"
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
	printf(" Prime numbers:");
	for(int i=min;i<max;i++){
		if(isPrime(i)){
			printf(", %d ", i);
		}
	}
	printf("\n Armstrong numbers:");
	for(int i=min;i<max;i++){
		if(isArmstrong(i)){
			printf(", %d ", i);
		}
	}
	printf("\n Strong numbers:");
	for(int i=min;i<max;i++){
		if(isStrong(i)){
			printf(", %d ", i);
		}
	}
	printf("\n Palindrome numbers:");
	for(int i=min;i<max;i++){
		if(isPalindrome(i)){
			printf(", %d ", i);
		}
	}
	printf("\n");
}
