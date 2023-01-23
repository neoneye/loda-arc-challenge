; Submitted by Simon Strandgaard
; Program Type: advanced

mov $80,$99
mov $81,100
mov $82,102
lps $80
  mov $0,$$81
  f11 $0,102001 ; Image: Extracts the least popular object.
  mov $$82,$0
  add $81,10
  add $82,10
lpe

; template: "48d8fb45-1.asm"
; mutate: CallLeastPopularProgram, no change
; mutate: ReplaceSourceConstantWithHistogram, no change
; mutate: CallMediumPopularProgram, no change
; mutate: CallLeastPopularProgram, no change
; mutate: CallRecentProgram, no change
; mutate: SetSourceToDirect, no change
; mutate: CallRecentProgram, no change
; mutate: CallRecentProgram, no change
; mutate: ReplaceTargetWithHistogram, no change
; mutate: ReplaceSourceWithHistogram, no change
; mutate: ReplaceLineWithHistogram
