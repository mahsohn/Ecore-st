as yet unclassified
createEContentsEList: anEObject
	| structuralFeatures |
	structuralFeatures := anEObject eClass eAllStructuralFeatures containments.
	structuralFeatures ifNil: [ ^EContentsEList emptyContentsEList ] 
							ifNotNil: [ ^EContentsEList new: anEObject eStructuralFeatures: structuralFeatures ].  