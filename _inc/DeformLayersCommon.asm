
moveScreenHoriz: macro v_posx

		move.w	(v_posx).w,d1
		move.w	(v_player+obX).w,d0
		sub.w	d1,d0 ; Sonic's distance from left edge of screen
		subi.w	#144,d0		; is distance less than 144px?
		bcs.s	@SH_BehindMid	; if yes, branch
		subi.w	#16,d0		; is distance more than 160px?
		bcc.s	@SH_AheadOfMid	; if yes, branch
		moveq #0, d0
		bra.s @SH_Ahead16

; ===========================================================================
		
@SH_BehindMid:
		add.w	d1,d0
		maxRefS v_limitleft2, d0, @SH_SetScreen
		
; ===========================================================================

@SH_AheadOfMid:
		cmpi.w	#16,d0		; is Sonic within 16px of middle area?
		bcs.s	@SH_Ahead16	; if yes, branch
		move.w	#16,d0		; set to 16 if greater

	@SH_Ahead16:
		add.w	d1,d0
		minRefS v_limitright2, d0

@SH_SetScreen:
		move.w	d0,(v_posx).w ; set new screen position
	endm
