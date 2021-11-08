#include <stdio.h>
#include "NumClass.h"
int isPrime(int num){
	if(num<2){
		return 0;
	}
	for(int i=2; i<=num/2;i++){
		if(num%i==0 && num!=2){
			return 0;
		}
	}
	return 1;
}
int Factorial(int num){
	int ans=1;
	for(int i=1;i<=num;i++){
		ans=ans*i;
	}
	return ans;
}
int isStrong(int num){
	int temp=num;
	int sum=0;
	while(num!=0){
		sum+=Factorial(num%10);
		num=num/10;
	}
	num=temp;
	if(sum==num){
		return 1;
	}
	return 0;
}

