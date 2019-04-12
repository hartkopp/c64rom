.PAG 'CODE18'
	STX FACMOH
	LDX FACMO+1
	STX FACMO
	LDX FACOV
	STX FACLO
	STY FACOV
	ADC #@10
ADDPR2	=ADDPRC+ADDPRC
ADDPR4	=ADDPR2+ADDPR2
ADDPR8	=ADDPR4+ADDPR4
	CMP #@30+ADDPR8
	BNE NORM3
ZEROFC	LDA #0
ZEROF1	STA FACEXP
ZEROML	STA FACSGN
	RTS
FADD2	ADC OLDOV
	STA FACOV
	LDA FACLO
	ADC ARGLO
	STA FACLO
	LDA FACMO
	ADC ARGMO
	STA FACMO
	LDA FACMOH
	ADC ARGMOH
	STA FACMOH
	LDA FACHO
	ADC ARGHO
	STA FACHO
	JMP SQUEEZ
NORM2	ADC #1
	ASL FACOV
	ROL FACLO
	ROL FACMO
	ROL FACMOH
	ROL FACHO
NORM1	BPL NORM2
	SEC
	SBC FACEXP
	BCS ZEROFC
	EOR #@377
	ADC #1
	STA FACEXP
SQUEEZ	BCC RNDRTS
RNDSHF	INC FACEXP
	BEQ OVERR
	ROR FACHO
	ROR FACMOH
	ROR FACMO
	ROR FACLO
	ROR FACOV
RNDRTS	RTS
NEGFAC	LDA FACSGN
	EOR #@377
	STA FACSGN
NEGFCH	LDA FACHO
	EOR #@377
	STA FACHO
	LDA FACMOH
	EOR #@377
	STA FACMOH
	LDA FACMO
	EOR #@377
	STA FACMO
	LDA FACLO
	EOR #@377
	STA FACLO
	LDA FACOV
	EOR #@377
	STA FACOV
	INC FACOV
	BNE INCFRT
INCFAC	INC FACLO
	BNE INCFRT
	INC FACMO
	BNE INCFRT
	INC FACMOH
	BNE INCFRT
	INC FACHO
INCFRT	RTS
OVERR	LDX #ERROV
	JMP ERROR
MULSHF	LDX #RESHO-1
SHFTR2	LDY 3+ADDPRC,X
	STY FACOV
	LDY 3,X
	STY 4,X
	LDY 2,X
	STY 3,X
	LDY 1,X
	STY 2,X
	LDY BITS
	STY 1,X
SHIFTR	ADC #@10
	BMI SHFTR2
	BEQ SHFTR2
	SBC #@10
	TAY
	LDA FACOV
	BCS SHFTRT
SHFTR3	ASL 1,X
	BCC SHFTR4
	INC 1,X
SHFTR4	ROR 1,X
	ROR 1,X
ROLSHF	ROR 2,X
	ROR 3,X
	ROR 4,X
	ROR A
	INY
	BNE SHFTR3
SHFTRT	CLC
	RTS
FONE	.BYT @201,0,0,0,0
LOGCN2	.BYT 3,@177,@136,@126
	.BYT @313,@171,@200,@23
	.BYT @233,@13,@144,@200
	.BYT @166,@70,@223,@26
	.BYT @202,@70,@252,@73,@40
SQR05	.BYT @200,@65,4,@363,@64
SQR20	.BYT @201,@65,@4,@363,@64
NEGHLF	.BYT @200,@200,0,0,0
LOG2	.BYT @200,@61,@162,@27,@370
.END