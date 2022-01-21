TYPE=VIEW
query=select `redundant_keys`.`table_schema` AS `table_schema`,`redundant_keys`.`table_name` AS `table_name`,`redundant_keys`.`index_name` AS `redundant_index_name`,`redundant_keys`.`index_columns` AS `redundant_index_columns`,`redundant_keys`.`non_unique` AS `redundant_index_non_unique`,`dominant_keys`.`index_name` AS `dominant_index_name`,`dominant_keys`.`index_columns` AS `dominant_index_columns`,`dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if((`redundant_keys`.`subpart_exists` or `dominant_keys`.`subpart_exists`),1,0) AS `subpart_exists`,concat(\'ALTER TABLE `\',`redundant_keys`.`table_schema`,\'`.`\',`redundant_keys`.`table_name`,\'` DROP INDEX `\',`redundant_keys`.`index_name`,\'`\') AS `sql_drop_index` from (`sys`.`x$schema_flattened_keys` `redundant_keys` join `sys`.`x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = \'PRIMARY\'),\'\',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = \'PRIMARY\'),\'\',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,\',\'),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,\',\'),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0))))
md5=1b12e68995777cbf9449b06bc708f827
updatable=0
algorithm=1
definer_user=mysql.sys
definer_host=localhost
suid=0
with_check_option=0
timestamp=2022-01-21 15:17:01
create-version=1
source=SELECT redundant_keys.table_schema, redundant_keys.table_name, redundant_keys.index_name AS redundant_index_name, redundant_keys.index_columns AS redundant_index_columns, redundant_keys.non_unique AS redundant_index_non_unique, dominant_keys.index_name AS dominant_index_name, dominant_keys.index_columns AS dominant_index_columns, dominant_keys.non_unique AS dominant_index_non_unique, IF(redundant_keys.subpart_exists OR dominant_keys.subpart_exists, 1 ,0) AS subpart_exists, CONCAT( \'ALTER TABLE `\', redundant_keys.table_schema, \'`.`\', redundant_keys.table_name, \'` DROP INDEX `\', redundant_keys.index_name, \'`\' ) AS sql_drop_index FROM x$schema_flattened_keys AS redundant_keys INNER JOIN x$schema_flattened_keys AS dominant_keys USING (TABLE_SCHEMA, TABLE_NAME) WHERE redundant_keys.index_name != dominant_keys.index_name AND ( (  /* Identical columns */ (redundant_keys.index_columns = dominant_keys.index_columns) AND ( (redundant_keys.non_unique > dominant_keys.non_unique) OR (redundant_keys.non_unique = dominant_keys.non_unique  	AND IF(redundant_keys.index_name=\'PRIMARY\', \'\', redundant_keys.index_name) > IF(dominant_keys.index_name=\'PRIMARY\', \'\', dominant_keys.index_name) ) ) ) OR (  /* Non-unique prefix columns */ LOCATE(CONCAT(redundant_keys.index_columns, \',\'), dominant_keys.index_columns) = 1 AND redundant_keys.non_unique = 1 ) OR (  /* Unique prefix columns */ LOCATE(CONCAT(dominant_keys.index_columns, \',\'), redundant_keys.index_columns) = 1 AND dominant_keys.non_unique = 0 ) )
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `redundant_keys`.`table_schema` AS `table_schema`,`redundant_keys`.`table_name` AS `table_name`,`redundant_keys`.`index_name` AS `redundant_index_name`,`redundant_keys`.`index_columns` AS `redundant_index_columns`,`redundant_keys`.`non_unique` AS `redundant_index_non_unique`,`dominant_keys`.`index_name` AS `dominant_index_name`,`dominant_keys`.`index_columns` AS `dominant_index_columns`,`dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if((`redundant_keys`.`subpart_exists` or `dominant_keys`.`subpart_exists`),1,0) AS `subpart_exists`,concat(\'ALTER TABLE `\',`redundant_keys`.`table_schema`,\'`.`\',`redundant_keys`.`table_name`,\'` DROP INDEX `\',`redundant_keys`.`index_name`,\'`\') AS `sql_drop_index` from (`sys`.`x$schema_flattened_keys` `redundant_keys` join `sys`.`x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = \'PRIMARY\'),\'\',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = \'PRIMARY\'),\'\',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,\',\'),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,\',\'),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0))))
