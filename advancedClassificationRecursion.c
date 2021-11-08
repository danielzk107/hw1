#include <stdio.h>
#include "NumClass.h"
int pow2(int base, int power){
int ans=1;
for(int i=0;i<power;i++){
	ans=ans*base;
}
return ans;
}
int isArmstrong1(int num, int power){
	if(num==0){
		return 0;
	}
	int ans = pow2(num%10,power)+isArmstrong1(num/10,power);
	return ans;
}
int isArmstrongRecursion(int num){
	int numofdigits=0;
	int temp=num;
	while(temp!=0){
		numofdigits++;
		temp=temp/10;
	}
	if(isArmstrong1(num, numofdigits)==num){
		return 1;
	}
	return 0;
}
int doPalindrome(int num, int ans){
	if(num==0){
		return ans;
	}
	ans =ans*10+num%10;
	return doPalindrome(num/10,ans);
}
int isPalindromeRecursion(int num){
	if(doPalindrome(num/10, num%10)==num){
		return 1;
	}
	return 0;
}

