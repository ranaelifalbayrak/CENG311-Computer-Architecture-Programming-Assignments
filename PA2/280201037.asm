##############################################################
#Array
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Size
##############################################################

##############################################################
#Linked List Node
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Address of the Next Node
##############################################################

##############################################################
#Song
##############################################################
#   4 Bytes - Address of the Name (name itself is 64 bytes)
#   4 Bytes - Duration
##############################################################


.data
space: .asciiz " "
newLine: .asciiz "\n"
tab: .asciiz "\t"

name: .asciiz "Song name: "
duration: .asciiz "Song duration: "
emptyList: .asciiz "List is empty!\n"
noSong: .asciiz "\nSong not found!\n"
foundSong: .asciiz "\nSong found!\n"
songAdded: .asciiz "\nSong added.\n"

copmStr: .space 64

sReg: .word 3, 7, 1, 2, 9, 4, 6, 5
arrayOfPlaylistsAddress: .word 0 #the address of the array of playlists stored here!


p1s1: .asciiz "Summer Breeze"
p1s1_duration: .word 124

p1s2: .asciiz "Rhythm of the Night"
p1s2_duration: .word 225

p1s3: .asciiz "Golden Days"
p1s3_duration: .word 192

p1s4: .asciiz "Dancing in the Moonlight"
p1s4_duration: .word 186

p1s5: .asciiz "Island Paradise"
p1s5_duration: .word 213

p2s1: .asciiz "Chill Vibes"
p2s1_duration: .word 198

p2s2: .asciiz "Smooth Jazz Serenade"
p2s2_duration: .word 213

p2s3: .asciiz "Dreamscape"
p2s3_duration: .word 156

p2s4: .asciiz "Mellow Melodies"
p2s4_duration: .word 177

p2s5: .asciiz "Sunny Side Up"
p2s5_duration: .word 204

p3s1: .asciiz "Rock 'n Roll Classics"
p3s1_duration: .word 214

p3s2: .asciiz "Electric Dreams"
p3s2_duration: .word 199

p3s3: .asciiz "Highway to Heaven"
p3s3_duration: .word 235

p3s4: .asciiz "City Lights"
p3s4_duration: .word 186

p3s5: .asciiz "Rebel Yell"
p3s5_duration: .word 192

p4s1: .asciiz "Acoustic Serenity"
p4s1_duration: .word 176

p4s2: .asciiz "Gentle Guitar Grooves"
p4s2_duration: .word 205

p4s3: .asciiz "Woodland Whispers"
p4s3_duration: .word 153

p4s4: .asciiz "Folklore Fantasia"
p4s4_duration: .word 218

p4s5: .asciiz "Countryside Carols"
p4s5_duration: .word 242

p5s1: .asciiz "Hip-Hop Heatwave"
p5s1_duration: .word 193

p5s2: .asciiz "Urban Dreams"
p5s2_duration: .word 208

p5s3: .asciiz "Rap Revolution"
p5s3_duration: .word 177

p5s4: .asciiz "Street Symphony"
p5s4_duration: .word 205

p5s5: .asciiz "Groove City Groceries"
p5s5_duration: .word 221


search1: .asciiz "Highway to Heaven"
search2: .asciiz "Master of Puppets"

.text 
main:

	la $t0, sReg
	lw $s0, 0($t0)
	lw $s1, 4($t0)
	lw $s2, 8($t0)
	lw $s3, 12($t0)
	lw $s4, 16($t0)
	lw $s5, 20($t0)
	lw $s6, 24($t0)
	lw $s7, 28($t0)

mainStart:

#Write your instructions here!
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    li $a0, 2
    jal createArray
    move $s0, $v0
    
    li $a0, 3  
    jal createArray 
    la $t1, arrayOfPlaylistsAddress
    sw $v0, 0($t1)
    sw $v0, 0($s0)
    srl $a0, $a0, 2
    sw $a0, 4($s0)

    jal createLinkedList
    move $a2, $v0
    lw $a0, 0($t1)
    li $a1, 0
    jal putElementToArray
    
    jal createLinkedList
    move $a2, $v0
    lw $a0, 0($t1)
    li $a1, 1
    jal putElementToArray
    
    jal createLinkedList
    move $a2, $v0
    lw $a0, 0($t1)
    li $a1, 2
    jal putElementToArray
    
    lw $a0, 0($t1)
    li $a1, 3
    li $a2, 5
    jal resizeArray
    la $t1, arrayOfPlaylistsAddress
    sw $v0, 0($t1)
    sw $v0, 0($s0)
    srl $a0, $a0, 2
    sw $a0, 4($s0)
    
    jal createLinkedList
    move $a2, $v0
    lw $a0, 0($t1)
    li $a1, 3
    jal putElementToArray
    
    jal createLinkedList
    move $a2, $v0
    lw $a0, 0($t1)
    li $a1, 4
    jal putElementToArray
    
    la $a0, p1s1         
    lw $a1, p1s1_duration    
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 0($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall 
    
    la $a0, p1s2         
    lw $a1, p1s2_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 0($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p1s3        
    lw $a1, p1s3_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 0($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4      
    syscall  
    
    la $a0, p1s4         
    lw $a1, p1s4_duration    
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 0($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded   
    li $v0, 4       
    syscall  
    
    la $a0, p2s1         
    lw $a1, p2s1_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 4($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p2s2         
    lw $a1, p2s2_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 4($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p2s3         
    lw $a1, p2s3_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 4($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded   
    li $v0, 4       
    syscall  
    
    la $a0, p2s4         
    lw $a1, p2s4_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 4($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall    
          
    
    la $a0, p3s1         
    lw $a1, p3s1_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 8($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p3s2         
    lw $a1, p3s2_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 8($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p3s3        
    lw $a1, p3s3_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 8($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4      
    syscall  
    
    la $a0, p3s4         
    lw $a1, p3s4_duration    
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 8($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall   
    
    la $a0, p4s1         
    lw $a1, p4s1_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 12($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p4s2         
    lw $a1, p4s2_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 12($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded   
    li $v0, 4       
    syscall  
    	
    la $a0, p4s3         
    lw $a1, p4s3_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 12($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p4s4         
    lw $a1, p4s4_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 12($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p5s1         
    lw $a1, p5s1_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 16($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p5s2         
    lw $a1, p5s2_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 16($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p5s3         
    lw $a1, p5s3_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 16($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p5s4         
    lw $a1, p5s4_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 16($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall 
    
    la $a0, printSong
    la $a1, 0($s0)
    jal traverseArray
    
    li $a3, 0
    lw $t5, 0($s0)
    lw $t7, 4($s0)
    li $a2, 1
    li $a1, 1
    remove_second_song:
    	sll $t6, $a3,2
    	add $t6, $t6, $t5
    	lw $a0, 0($t6)
    	jal removeElementFromTheLinkedList
    	addi $a3, $a3, 1
    	bne  $a3, $t7, remove_second_song
    	
    la $a0, printSong
    la $a1, 0($s0)
    jal traverseArray
    	
    la $a0, p1s5         
    lw $a1, p1s5_duration    
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 0($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall 
    
    la $a0, p2s5         
    lw $a1, p2s5_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 4($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall
    
    la $a0, p3s5         
    lw $a1, p3s5_duration    
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 8($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall 
    
    la $a0, p4s5         
    lw $a1, p4s5_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 12($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall  
    
    la $a0, p5s5         
    lw $a1, p5s5_duration     
    jal createSong
    lw $a0, 0($s0)
    lw $a0, 16($a0)
    la $a1, 0($v0)
    jal putElementToLinkedList
    la $a0, songAdded    
    li $v0, 4       
    syscall   
    	 
    la $a0, printSong
    la $a1, 0($s0)
    jal traverseArray
    
    la $a0, 0($s0)
    li $a1, 3
    jal removeElementFromArray
    
    la $a0, printSong
    la $a1, 0($s0)
    jal traverseArray
    
    la $a0, isSong
    la $a1, 0($s0)
    jal traverseArray
    
    
    lw $t9,0($sp)
    move $s0, $t9
    addi $sp,$sp,4
    
  
     
	
mainTerminate:
	la $a0, newLine		
	li $v0, 4
	syscall
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	move $a0, $s1
	syscall
	move $a0, $s2
	syscall
	move $a0, $s3
	syscall
	move $a0, $s4
	syscall
	move $a0, $s5
	syscall
	move $a0, $s6
	syscall
	move $a0, $s7
	syscall
	
	li $v0, 10
	syscall


createArray:
	
	#Write your instructions here!
    	li $t0, 4         
    	mul $t1, $a0, $t0   
   	li $v0, 9          
    	move $a0, $t1        
    	syscall                
    	jr $ra            
	

resizeArray:
	
	#Write your instructions here!
	li $t0, 4          
    	mul $a2, $a2, $t0   
    	li $v0, 9          
    	move $t2, $a0
    	move $a0, $a2       
    	syscall                 
    	move $t5,$v0
    	add $t3, $t2, $a2   
    	copy:
    		beq $t2, $t3, end
    		lw $t4, 0($t2)     # load from old array
    		sw $t4, 0($t5)     #store in new array
    		addi $t2, $t2, 4     
    		addi $t5, $t5, 4     
    		j copy
	end:
    		jr $ra              
   	
   	  
putElementToArray:
	
	#Write your instructions here!
	sll $t5, $a1, 2       
    	add $t5, $a0, $t5     
    	sw $a2, 0($t5)        

	jr $ra
	
removeElementFromArray:
	
	#Write your instructions here!
	lw $a2, 4($a0)
	lw $a0, 0($a0)
	sll $t1, $a1, 2    
        add $t1, $a0, $t1 #t1 adress to remove element  
    	sll $t3, $a2, 2   
    	add $t3, $a0, $t3 #t3 adress of last element in array 

	shift_next_elements:
    		addi $t1, $t1, 4  
    		lw $t2, 0($t1)    
    		sw $t2, -4($t1)   
    		addi $t4, $t1, 4  
   		bne $t4, $t3, shift_next_elements 

	addi $a2, $a2,-1 
	sw $a2, 4($s0) #update the size
    	jr $ra            
    

createLinkedList:
	
	#Write your instructions here!
	li $a0, 8
        li $v0, 9       
        syscall        
	jr $ra

putElementToLinkedList:
	
	#Write your instructions here!
	lw $t4, 0($a0)
	beq $t4, $zero, head_node   
    	move $t0, $a0            
	
	find_last_node:
    		lw $t1, 4($t0)            
    		beq $t1, $zero, insert_node
    		move $t0, $t1	
    		j find_last_node

        insert_node:
        	li $a0, 8
        	li $v0, 9       
        	syscall
        	sw $v0, 4($t0)
        	sw $a1, 0($v0)
        	jr $ra    
	head_node:
    		sw $a1, 0($a0)
    		jr $ra         


removeElementFromTheLinkedList:
	
	#Write your instructions here!
    	beqz $a1, remove_first_node      
    	move $t0, $a0      
    	move $t1, $zero   #index
    	addi $t1, $t1, 1
    	find_previous_node:
    		lw $t2, 4($t0)    
    		#beq $t2, $zero, exit  # If next is NULL, end function
    		beq $t1, $a1, remove_node 
    		move $t0, $t2
    		addi $t1, $t1, 1  
    		j find_previous_node
    	remove_node:
    		lw $t4, 4($t2)    
    		sw $t4, 4($t0)    
    		j exit
	remove_first_node:
    		lw $t0, 4($a0)     
    		sw $t0, 4($a0)     
	exit:
    		jr $ra            


traverseArray:

	#Write your instructions here!
	addi $sp, $sp, -4
	sw $ra, 0($sp)
    	lw $t8, 0($a1)    
    	lw $t1, 4($a1)     
    	beq $t1, $zero, end_traverse_array
    	li $t9, 0       

	traverse_array_loop:
		addi $sp, $sp, -12
		sw $a1, 0($sp)
		sw $a0, 4($sp)
		sw $t1, 8($sp)
    		sll $t3, $t9, 2   
    		add $t3, $t8, $t3 
    		lw $a1, 0($t3)
    		move $a0, $a0     
    		jal traverseLinkedList
    		lw $a1, 0($sp)
    		lw $a0, 4($sp)
    		lw $t1, 8($sp)
    		addi $sp, $sp, 12
    		addi $t9, $t9,1 
    		bne $t9, $t1, traverse_array_loop

	end_traverse_array:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
    	jr $ra           



traverseLinkedList:
	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $a2, 4($sp)
	#Write your instructions here!
	move $a2, $a0
	traverse_linked_list_loop:
    		lw $a0, 0($a1)
    		jalr $a2          
    		la $a0, newLine    
    		li $v0, 4       
    		syscall
    		lw $a1, 4($a1)    
    		bne $a1, $zero, traverse_linked_list_loop
    	lw $ra 0($sp)
    	lw $a2, 4($sp)
    	addi $sp, $sp, 8

    	jr $ra           
	
	

createSong:
	
	#Write your instructions here!
    	move $t2, $a0
    	li $a0, 8                
    	li $v0, 9                
    	syscall                  
    	sw $t2, 0($v0) 
    	sw $a1, 4($v0)     
    	                  
	jr $ra

isSong:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a0, 12($sp)
	#Write your instructions here!
	lw $a0, 0($a0)
	la $a1, search1
	li $a2, 64
	jal compareString
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $a0, 12($sp)
	move $t5, $a0
	addi $sp, $sp, 16
	beq $v0, 1, found1
	la $a0, noSong
	li $v0, 4
	syscall
	move $a0, $t5
	

	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a0, 12($sp)
	lw $a0, 0($a0)
	la $a1, search2
	li $a2, 64
	jal compareString
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $a0, 12($sp)
	addi $sp, $sp, 16
	beq $v0, 1, found2
	
	la $a0, noSong
	li $v0, 4
	syscall
	jr $ra
	found1:
		la $a0, foundSong
		li $v0, 4
		syscall
		la $a0, newLine
		syscall
		la $a0, search1
		syscall
		jr $ra
	found2:
		la $a0, foundSong
		li $v0, 4
		syscall
		la $a0, newLine
		syscall
		la $a0, search2
		syscall
		jr $ra
compareString:
	
	#Write your instructions here!
	compare:
    		lb $t0, 0($a0)  
    		lb $t1, 0($a1)
    		bne $t0, $t1, different  
    		beqz $t0, same
    		addi $a0, $a0, 1
    		addi $a1, $a1, 1
    		addi $a2, $a2, -1
    		bnez $a2, compare   
    	same:
    		li $v0, 1  
    		jr $ra

	different:
    		li $v0, 0  
    		jr $ra     


printSong:
	move $t2, $a0
	#Write your instructions here!
	lw $t0, 0($a0)  

    	la $a0, name    
    	li $v0, 4       
    	syscall
    	move $a0, $t0   
    	li $v0, 4       
    	syscall
    
    	la $a0, space    
    	li $v0, 4       
    	syscall

    	lw $t3, 4($t2)  
    	la $a0, duration 
   	li $v0, 4        
    	syscall
    	move $a0, $t3   
    	li $v0, 1       
    	syscall
	jr $ra



