if exists('g:no_tlaplus_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

set iskeyword+=\
set iskeyword+=>
set iskeyword+=<
set iskeyword+==
set iskeyword+=.

" these are not working
"<- ←
"\|-> ↦
"-> →
">>_ ⟩_
"[] □
":: ∷
"~ ¬
"-+-> ⇸
"~> ↝
"/\ ∧
"\/ ∨
":= ≔
"::= ⩴
"/= ≠
"\|- ⊢
"\|= ⊨
"-\| ⊣
"=\| ⫤
"(+) ⊕
"(-) ⊖
"\|\| ‖
"(.) ⊙
"(/) ⊘
"(\X) ⊗
"!! ‼
"?? ⁇
"^+ ⁺
let s:ops =<< trim END
== ≜
\\in ∈
<- ←
\\A ∀
\\forall ∀
\\E ∃
\\exists ∃
\\|-> ↦
-> →
<< ⟨
>> ⟩
[] □
<> ⋄
:: ∷
~ ¬
\\lnot ¬
\\neg ¬
=> ⇒
-+-> ⇸
\\equiv ≡
<=> ⇔
~> ↝
/\\ ∧
\\land ∧
\\/ ∨
\\lor ∨
:= ≔
::= ⩴
/= ≠
# ≠
<= ≤
=< ≤
\\leq ≤
>= ≥
\\geq ≥
\\approx ≈
\\|- ⊢
\\|= ⊨
-\| ⊣
=\| ⫤
\\asymp ≍
\\cong ≅
\\doteq ≐
\\gg ≫
\\ll ≪
\\notin ∉
\\prec ≺
\\succ ≻
\\preceq ⪯
\\succeq ⪰
\\propto ∝
\\sim ∼
\\simeq ≃
\\sqsubset ⊏
\\sqsupset ⊐
\\sqsubseteq ⊑
\\sqsupseteq ⊒
\\subset ⊂
\\supset ⊃
\\subseteq ⊆
\\supseteq ⊇
\\intersect ∩
\\cap ∩
\\union ∪
\\cup ∪
.. ‥
... …
(+) ⊕
\\oplus ⊕
(-) ⊖
\\ominus ⊖
\|\| ‖
(.) ⊙
\\odot ⊙
\\oslash ⊘
(\\X) ⊗
\\otimes ⊗
\\bigcirc ◯
\\bullet ●
\\div ÷
\\o ∘
\\circ ∘
\\star ⋆
\\sqcap ⊓
\\sqcup ⊔
\\uplus ⊎
\\times ×
\\wr ≀
\\cdot ⋅
(/) ⊘
\X ×
!! ‼
?? ⁇
^+ ⁺
END

for s:e in s:ops
  let s:pair = split(s:e)
  exe 'syn keyword tla_op ' . s:pair[0] . ' conceal cchar=' . s:pair[1]
endfor

hi link tla_op Operator
hi! link Conceal Operator
