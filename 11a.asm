.model small
.data
msg1 db 10,13,"enter row number $"
msg2 db 10,13,"enter col number $"
msg3 db 10,13,"press any key to stop $"
row db ?
col db ?
.code
mov ax,@data
mov ds,ax
lea dx,msg1
mov ah,09h
int 21h
call read
mov row,al
lea dx,msg2
mov ah,09h
int 21h
call read
mov col,al
lea dx,msg3
mov ah,9
int 21h
mov ah,2
mov dh,row
mov dl,col
int 10h
mov ah,8
int 21h
mov ah,4ch
int 21h
read:mov ah,1
        int 21h
        and al,0fh
        mov bl,al
        mov ah,1
        int 21h
        and al,0fh
        mov ah,bl
        aad
        ret
        end


