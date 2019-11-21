as yet unclassified
derivationKind
	derivationKind ifNil: [ 
			baseType ifNotNil: [ ^derivationKind := ECoreExtendedMetaData RESTRICTED_DERIVATION ].
			itemType ifNotNil: [ ^derivationKind := ECoreExtendedMetaData LIST_DERIVATION ].
			(memberTypes notNil & memberTypes size isZero not) ifTrue: [ 
				^derivationKind := ECoreExtendedMetaData UNION_DERIVATION
			].
			derivationKind := 1.
		 ].
	^derivationKind