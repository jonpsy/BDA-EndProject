REGISTER /home/hadoopusr/pig-0.17.0/lib/piggybank.jar;


chicago = LOAD 'hdfs://localhost:9000/pig_data/Chicago_Crimes_2012_to_2017.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS (initial:int, id:int, case_number:chararray, date:chararray, block:chararray, iucr:chararray, primary_type:chararray, description:chararray, location_description:chararray, arrest:Boolean, domestic :Boolean, beat:int, district:float, ward: float, community_area: float, fbi_code:chararray, x_coord:float, y_coord:float, year:int, updated_on: chararray, latitude: float, longitude: float, location: chararray);

out = FOREACH chicago GENERATE arrest, domestic, beat, community_area, latitude, longitude, year;


STORE out INTO 'hdfs://localhost:9000/preprocessed_out/' using PigStorage(',', '-schema');
