.model small
.data
   msg1 db 10,13,"enter filename to be created: $"
   msg2 db 10,13,"enter filename to be deleted: $"
   msg3 db "1:create",10,13,"0:delete$"
   msg4 db 10,13,"enter your choice$"
   msg5 db "error $"
   f_name db 80 dup(0)

.code
   mov ax,@data
   mov ds,ax
   lea dx,msg3
   mov ah,9
   int 21h
   lea dx,msg4
   mov ah,9
   int 21h
   mov ah,1
   int 21h
   cmp al,'1'
   jz c_file
   cmp al,'0'
   jz d_file
error:lea dx,msg5
   mov ah,9
   int 21h
   mov ah,4ch
   int 21h
c_file:lea dx,msg1
   mov ah,9
   int 21h
   call read
   mov cx,0
   mov ah,3ch
   lea dx,f_name
   int 21h
   jc error
   mov ah,4ch
   int 21h
d_file:lea dx,msg2
    mov ah,9
    int 21h
    call read
    lea dx,f_name
    mov ah,41h
    int 21h
    jc error
    mov ah,4ch
    int 21h
read:mov ah,1
    lea si,f_name
bak:int 21h
    cmp al,0dh
    jz done
    mov [si],al
    inc si
    jmp bak
done:ret
     end


