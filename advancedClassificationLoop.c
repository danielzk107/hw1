#include <stdio.h>
#include "NumClass.h"
int pow1(int base, int power){
int ans=1;
for(int i=0;i<power;i++){
	ans=ans*base;
}
return ans;
}
int isArmstrong(int num){
int numofdigits=0;
int temp=num;
while(temp!=0){
	numofdigits++;
	temp=temp/10;
}
temp=num;
int sum=0;
while(temp!=0){
	sum+= pow1(temp%10, numofdigits);
	temp=temp/10;
}
if(sum==num){
	return 1;
}
return 0;
}
int isPalindrome(int num){ 
int reverse=0;
int temp=num;
while(temp!=0){
	reverse=reverse*10;
	reverse+= temp%10;
	temp=temp/10;
}
if(num==reverse){
	return 1;
}
return 0;
}
