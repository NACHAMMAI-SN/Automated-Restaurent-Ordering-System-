.model small
.stack 100h
.data
    menu db '1. Ice Cream -- Rs 20', 0Dh, 0Ah
          db '2. Chicken 65 -- Rs 60', 0Dh, 0Ah
          db '3. Chicken Rice -- Rs 80', 0Dh, 0Ah
          db '4. Biriyani -- Rs 120', 0Dh, 0Ah
          db '5. Mutton Biriyani -- Rs 250', 0Dh, 0Ah, '$'

    prompt db 0Dh, 0Ah, 'Enter your choice (1-5): $'
    invalid db 0Dh, 0Ah, 'Invalid Choice! Try Again.$'
    
    orderMsg db 0Dh, 0Ah, 'You ordered: $'

    item1 db 0Dh, 0Ah, 'Ice Cream -- Rs 20$', 0
    item2 db 0Dh, 0Ah, 'Chicken 65 -- Rs 60$', 0
    item3 db 0Dh, 0Ah, 'Chicken Rice -- Rs 80$', 0
    item4 db 0Dh, 0Ah, 'Biriyani -- Rs 120$', 0
    item5 db 0Dh, 0Ah, 'Mutton Biriyani -- Rs 250$', 0

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax
    
    ; Display menu
    mov ah, 09h
    lea dx, menu
    int 21h
    
    ; Get user input
get_input:
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    ; Read input from keyboard
    mov ah, 01h
    int 21h
    
    ; Compare input to menu items
    cmp al, '1'          ; Check if '1' for Ice Cream
    je order_icecream
    cmp al, '2'          ; Check if '2' for Chicken 65
    je order_chicken65
    cmp al, '3'          ; Check if '3' for Chicken Rice
    je order_chickenrice
    cmp al, '4'          ; Check if '4' for Biriyani
    je order_biriyani
    cmp al, '5'          ; Check if '5' for Mutton Biriyani
    je order_muttonbiriyani

    ; Invalid choice
    mov ah, 09h
    lea dx, invalid
    int 21h
    jmp get_input

order_icecream:
    ; Display order for Ice Cream
    mov ah, 09h
    lea dx, orderMsg
    int 21h
    lea dx, item1
    int 21h
    jmp exit

order_chicken65:
    ; Display order for Chicken 65
    mov ah, 09h
    lea dx, orderMsg
    int 21h
    lea dx, item2
    int 21h
    jmp exit

order_chickenrice:
    ; Display order for Chicken Rice
    mov ah, 09h
    lea dx, orderMsg
    int 21h
    lea dx, item3
    int 21h
    jmp exit

order_biriyani:
    ; Display order for Biriyani
    mov ah, 09h
    lea dx, orderMsg
    int 21h
    lea dx, item4
    int 21h
    jmp exit

order_muttonbiriyani:
    ; Display order for Mutton Biriyani
    mov ah, 09h
    lea dx, orderMsg
    int 21h
    lea dx, item5
    int 21h
    jmp exit

exit:
    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
