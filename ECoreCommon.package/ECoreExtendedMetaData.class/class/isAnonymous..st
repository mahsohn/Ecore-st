testing
isAnonymous: eClassifier
	| name |
	name := (self getExtendedMetaData: eClassifier) getName.
	^ (name size == 0) | ((name findString: '_._') > 0)