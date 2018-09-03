IF NOT EXISTS(SELECT * FROM EvalType WHERE Id = 1)
BEGIN
	INSERT INTO EvalType VALUES
		(1, 'Functional');
END

IF NOT EXISTS(SELECT * FROM DataType WHERE Id = 4)
BEGIN
	INSERT INTO DataType VALUES
		(1, 'Int32'), 
		(2, 'String'), 
		(3, 'Double'), 
		(4, 'IEnumerable<Int32>');
END