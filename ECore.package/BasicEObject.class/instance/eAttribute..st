as yet unclassified
eAttribute: name
	| eStructuralFeature |
	eStructuralFeature := self eClass eStructuralFeature: name.
	(eStructuralFeature isKindOf: EAttribute)  ifFalse: [ self error: 'The feature ', name, ' is not a valid attribute' ].
	^eStructuralFeature 