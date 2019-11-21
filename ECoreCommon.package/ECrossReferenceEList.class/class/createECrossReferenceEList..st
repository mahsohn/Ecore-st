as yet unclassified
createECrossReferenceEList: anEObject
	| structuralFeatures |
	structuralFeatures := anEObject eClass eAllStructuralFeatures crossReferences.
	structuralFeatures ifNil: [ ^EContentsEList emptyCrossReferenceEList ] 
							ifNotNil: [ ^ECrossReferenceEList new: anEObject eStructuralFeatures: structuralFeatures ]. 