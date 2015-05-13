.model small
.data
str1 db 100
db 0
db 100 dup(0)
str2 db 100
db 0
db 100 dup(0)
m1 db 'lenth of string1:'
l1 db ?,10,13,'$'
m2 db 'lenth of string2:'
l2 db ?,10,13,'$'
m3 db 'str1 is equal to str2$'
m4 db 'str1 is not equal to str2$'
m5 db 'enter the first string$'
m6 db 10,13,'enter the second string$'
.code
mov ax,@data
mov ds,ax
mov es,ax
lea dx,m5
mov ah,09h
int 21h
lea dx,str1
mov ah,0ah
int 21h
lea dx,m6
mov ah,09h
int 21h
lea dx,str2
mov ah,0ah
int 21h
mov cl,str1+1
mov bl,str2+1
add cl,30h
add bl,30h
mov l1,cl
mov l2,bl
sub cl,30h
sub bl,30h
lea dx,m1
mov ah,09h
int 21h
lea dx,m2
int 21h
cmp cl,bl
jz next
dm4:lea dx,m4
mov ah,09h
int 21h
jmp exit
next:lea si,str1+2
lea di,str2+2
cld
repe cmpsb
jnz dm4
lea dx,m3
mov ah,09h
int 21h
exit:mov ah,4ch
int 21h
end

