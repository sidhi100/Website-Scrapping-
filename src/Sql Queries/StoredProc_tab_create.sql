this is best way
ALTER PROC StoredProc_tab_create @no_of_tables INT
AS
BEGIN
SET nocount ON
	DECLARE @i INT
	SET @i=0
	DECLARE @cnt INT
	DECLARE @var varchar(10)
	DECLARE @create_query  VARCHAR(1000)
	DECLARE @drop_query  VARCHAR(1000)
	
WHILE(@i<@no_of_tables)
BEGIN
	SET @var = @i
	SELECT @cnt=COUNT(*)
	FROM information_schema.tables
	WHERE TABLE_CATALOG='master' AND TABLE_SCHEMA='dbo' AND TABLE_NAME='Places_'+@var

	

	if(@cnt=1)
	BEGIN
	--print @cnt
	SET @drop_query = 'DROP TABLE Places_' + @var 
	SET @create_query = 'CREATE TABLE Places_' + @var + '(Scenic_Place_Name varchar(100) , Latitude varchar(100) , Longitude varchar(100) , Address varchar(100) , Zipcode varchar(100) , Weather varchar(100) , Temperature varchar(100) , Traffic varchar(100), Safety varchar(100))'
	exec (@drop_query)
	exec (@create_query)

	END
	ELSE
	BEGIN
	SET @create_query = 'CREATE TABLE Places_' + @var + '(Scenic_Place_Name varchar(100) , Latitude varchar(100) , Longitude varchar(100) , Address varchar(100) , Zipcode varchar(100) , Weather varchar(100) , Temperature varchar(100) , Traffic varchar(100), Safety varchar(100))'
	exec (@create_query)
	--exec (@query)
	
--print @i
	END
	SET @i=@i+1
	
	
END

END
