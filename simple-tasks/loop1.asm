.model small
.stack 100h
.data
  prompt db 'The counting from 0 to 5 : $'

.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,prompt ;load and print prompt
    mov ah,9
    int 21h
    
    
    mov cx,6  ;initialize cx
    
    mov ah,2   ;set output function
    mov dl,48  ;set dl with 0
    
    @loop:
      int 21h
      inc dl
      dec cx  
      
      int ah,2
      add 
    jnz @loop
    
    mov ah,4ch
    int 21h
    main endp
end main