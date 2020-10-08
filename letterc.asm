assume cs:codesg
datasg segment
    db "Beginner's All-purpose Symbolic Instruction Code.",0
datasg ends
codesg segment
    begin:  mov ax,datasg
            mov ds,ax
            mov si,0
            call letterc
            mov ax,4c00h
            int 21h
    letterc:
            mov cx, 2
            cmp byte ptr ds:[si],0
            je return
            mov al,'a'
            cmp ds:[si],al
            jb ignore
            mov al,'z'
            cmp ds:[si],al
            ja ignore
            ; 说明'a'<=[si] <='z'
            and byte ptr ds:[si], 11011111B
    ignore: inc si
            loop letterc
    return: ret
codesg ends
end begin