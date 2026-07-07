CREATE DATABASE sicxc;

CREATE TABLE events (
	id BIGSERIAL 
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SELECT uuid_generate_v1();

SELECT uuid_generate_v4();
	
=LOWER(CONCATENATE(DEC2HEX(RANDBETWEEN(0,POWER(16,8)),8),"-",DEC2HEX(RANDBETWEEN(0,POWER(16,4)),4),"-","4",DEC2HEX(RANDBETWEEN(0,POWER(16,3)),3),"-",DEC2HEX(RANDBETWEEN(8,11)),DEC2HEX(RANDBETWEEN(0,POWER(16,3)),3),"-",DEC2HEX(RANDBETWEEN(0,POWER(16,8)),8),DEC2HEX(RANDBETWEEN(0,POWER(16,4)),4)))

CREATE TABLE contacts (
    contact_id uuid DEFAULT uuid_generate_v4 (),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    phone VARCHAR,
    PRIMARY KEY (contact_id)
);

--How to Run PostgreSQL VS2019 usign ODBC
--https://www.youtube.com/watch?v=ui91KG74gro

--ConnectionString
  <connectionStrings>
    <add name="ConnectionString" connectionString="Dsn=PostgresRun;uid=postgres;pwd=admin" providerName="System.Data.Odbc" />
  </connectionStrings>
  
--WINFORM
--https://www.youtube.com/watch?v=C1WBJUSVp1A

		using Npgsql;
		
        private void button1_Click(object sender, EventArgs e)
        {
            string strConnString = "server=localhost;port=5432;username=postgres;password=admin;database=winformtest";
            NpgsqlConnection objConn = new NpgsqlConnection(strConnString);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into test (test_value) values (@test)", objConn);
            objConn.Open();
            cmd.Parameters.AddWithValue("@test", textBox1.Text);
            cmd.ExecuteNonQuery();
            objConn.Close();

        }