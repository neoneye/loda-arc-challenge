; Submitted by Simon Strandgaard
; Program Type: advanced

mov $80,$99
mov $81,100 ; address of vector[0].InputImage
mov $82,102 ; address of vector[0].ComputedOutputImage
mov $83,114 ; address of vector[0].InputMostPopularColor
lps $80
  mov $0,$$81 ; input image
  mov $20,$$83 ; most popular color across inputs

  mov $8,$0
  f11 $8,101000 ; Get width of image
  div $8,2
  ; $9 is half width

  mov $9,$0
  f11 $9,101001 ; Get height of image
  div $9,2
  ; $9 is half height

  mov $1,$0
  mov $2,$8
  f21 $1,101222 ; get N left columns
  ; $1 is left half of image

  mov $3,$1
  mov $4,$9
  f21 $3,101220 ; get N top rows
  ; $3 is top-left quadrant

  mov $4,$1
  mov $5,$9
  f21 $4,101221 ; get N bottom rows
  ; $4 is bottom-left quadrant

  mov $5,$0
  mov $6,$8
  f21 $5,101223 ; get N right columns
  ; $5 is right half of image

  mov $6,$5
  mov $7,$9
  f21 $6,101220 ; get N top rows
  ; $6 is top-right quadrant

  mov $7,$5
  mov $8,$9
  f21 $7,101221 ; get N bottom rows
  ; $7 is bottom-right quadrant

  ; layer 0
  mov $0,$3 ; top-left quadrant

  ; layer 1
  mov $1,$7 ; bottom-right quadrant
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask
  
  ; layer 2
  mov $1,$4 ; bottom-left quadrant
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 3
  mov $1,$6 ; top-right quadrant
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  mov $$82,$0
  add $81,100
  add $82,100
  add $83,100
lpe
