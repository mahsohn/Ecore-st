as yet unclassified
eReference: name
	| eStructuralFeature |
	eStructuralFeature := self eClass eStructuralFeature: name.
	(eStructuralFeature isKindOf: EReference)  ifFalse: [ self error: 'The feature ', name, ' is not a valid reference' ].
	^eStructuralFeature 