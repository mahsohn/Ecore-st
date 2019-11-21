as yet unclassified
replace: in oldString: oldString newString: aNewString
	| newString result oldStringLength index newStringLength |
	newString := aNewString.
	(in isNil | oldString isNil) ifTrue: [ ^in ].
	oldStringLength := oldString size.
	oldStringLength isZero ifTrue: [ ^in ].
	newString ifNil: [ newString := '' ].
	result := in.
	"newStringLength := newString size.
	index = newStringLength negate."
	^result copyReplaceAll: oldString with: newString