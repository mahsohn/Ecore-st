instance creation
new: anEObject eStructuralFeatures: structuralFeatures
	^super new
	eObject: anEObject;
	eStructuralFeatures: structuralFeatures;
	yourself.