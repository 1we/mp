.model small
printf macro msg
mov ah,09h
mov dx,OFFSET msg
int 21h
endm
exit macro
mov ah,4ch
int 21h
endm
.data
a dw 1111h,2222h,3333h,4444h,5555h
n dw ($-a)/2
key dw 5555h
low_ dw ?
high_ dw ?
mid dw ?
msg1 db 'successful search $'
msg2 db 'unsuccessful search $'
.code
mov ax,@data
mov ds,ax
mov low_,0
mov ax,n
mov high_,ax
dec high_
l1:mov si,low_
cmp si,high_
jg l4
add si,high_
shr si,1
mov mid,si
mov ax,key
mov si,mid
shl si,1
cmp ax,a[si]
jne l2
printf msg1
exit
l2:cmp  ax,a[si]
jg l3
mov ax,mid
dec ax
mov high_,ax
jmp l1
l3:mov ax,mid
inc ax
mov low_,ax
jmp l1
l4:printf msg2
exit
end

