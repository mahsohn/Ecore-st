testing
includesKey: key
	^ (super includesKey: key) & delegateRegistry notNil & (delegateRegistry includesKey: key).