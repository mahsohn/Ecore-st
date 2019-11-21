as yet unclassified
eStructuralFeature: name
	| eStructuralFeature |
	eStructuralFeature := self eClass eStructuralFeature: name.
	eStructuralFeature ifNil: [ self error: 'The feature ', name, ' is not a valid feature' ].
	^eStructuralFeature 