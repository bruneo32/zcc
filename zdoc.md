# Z language
a

## Comments

	; LINE

	// LINE

	/*
	MULTI
	LINE
	*/

	###			Do not parse the code between ### and ###,
				it goes raw for the assembler

## Data types (from nasm)

	byte
	word
	dword
	qword
	(tword)

## Registers
				bits	16	32	64
	_z_ax				AX	EAX	RAX
	_z_bx				BX	EBX	RBX
	_z_cx				CX	ECX	RCX
	_z_dx				DX	EDX	RDX
	_z_si				SI	ESI	RSI
	_z_di				DI	EDI	RDI
	_z_sp				SP	ESP	RSP
	_z_bp				BP	EBP	RBP

	_z_rs				word	dword	qword
	_z_rsb				2	4	8


## Modifiers

	$abc		(Default)	byte [abc]
			word $abc	word [abc]
					...

## Z words

	def		(Default)	def var_name = 0,1,2,3,4		var_name: db 0,1,2,3,4
					def var_name = dw 0,1,2,3,4		var_name: dw 0,1,2,3,4
					...

	buf[n]				times n db 0
	put[n](c)			times n db c

	if				if (logic_block) {
						statements
	elif				} elif (logic_block){
						statements
	else				} else {
						statements
					}

	while				while (logic_block) {
						statements
					}

					* Since TRUE and FALSE does not exist in Z, you can use
					  while(){} to make an infinite loop


	for				for (init, logic_block, increment) {
						statements
					}

	continue			Go for the next cycle of a loop
	break				Break a loop

	zdefine				Define Z requirements for the assembler, like: zpush, _z_ax, ...
					Which are necessary for functions and other stuff

	zpusha				Push all the registers
	zpopa				Pop all the registers

	#include			#include <file>		from the zcc/includes directory
	* Compiles a z file		#include "file"		from the working directory
	  and includes it


## FUNCTIONS

	callf				callf function_name(parameters)		(Function call surrounded by zpusha and zpopa)
	callk				callk function_name(parameters)		(Function call keeping results)

	* Use callf or callk?		callk is a simple function call, but callf will save all the registers into the stack before
					calling the function, so you can play with any register you want inside the function without
					caring about the registers destroyed. The counter side is that you cannot return anything this way.

			Short answer:	Use callf for voids and callk for data return functions, but beware of the registers destroyed.


	function			function f_name(parameters){
						statements
					}

	return				Exit a function. DO NOT USE  RET instruction.



	* PARAMETERS			Parameters must specify the data type.	For example:	callf myadd(byte 3, byte 2)
	  For function,										Since for myadd(byte, byte) expected 2 fixed size parameters
	  callf and callk.		If no data type is provided, it will be
					understood as a memory address.		For example:	callf printstr(str_hello)
												Where str_hello is a memory address and its size
												relies on _z_rs.

			Examples:	function myadd(byte ax, byte bx){
						/**
						 * This function adds two numbers
						 * using:	callk myadd(byte num1, byte num2)
						 * return:	AX = num1+num2
						 * destroy:	AX, BX
						 */

						ax += bx
					}
					function printstr(si){
						/**
						 * This function prints a zero-terminated string allocated on the memory
						 * using:	callf printstr(string_addres)
						 */
						
						while ($si != 0){
							callf printchar(byte $si)
							si++
						}
					}


## OPERATORS

- assing
	a  = b			mov   a, b	
	a *= b			movzx a, b

	a += b			add a, b
	a -= b			sub a, b
	a++			inc a
	a--			dec a

- bitwise
	a << b			shl a, b
	a >> b			shr a, b
	~a			not a
	a & b			and a, b
	a | b			or  a, b
	a ^ b			xor a, b

- compare
	==
	!=
	<
	>
	<=
	>=

	&&
	||

	flagc			Test if CF is ON
	!flagc			Test if CF is OFF

	flagz			Test if ZF is ON
	!flagz			Test if ZF is OFF

	flags			Test if SF is ON
	!flags			Test if SF is OFF

	flagp			Test if PF is ON
	!flagp			Test if PF is OFF

	flago			Test if OF is ON
	!flago			Test if OF is OFF


## LOGIC BLOCKS

		Logic blocks can be in statements:  while, for (second argument), if and elif.
		

