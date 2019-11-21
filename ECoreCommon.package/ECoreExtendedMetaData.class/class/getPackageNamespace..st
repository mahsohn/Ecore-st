as yet unclassified
getPackageNamespace: eStructuralFeature
	| eContainingClass ePackage|
	eContainingClass := eStructuralFeature eContainingClass.
	eContainingClass ifNotNil: [ 
		ePackage := eContainingClass ePackage.
		ePackage ifNotNil: [ ^self getNamespace:  ePackage ]
	].
	^nil