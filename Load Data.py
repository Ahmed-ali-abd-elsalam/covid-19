import os

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine, text

# Load the .env file
load_dotenv()

# Access environment variables


DATABASE = os.getenv("DATABASE")
USER = os.getenv("USER")
PASSWORD = os.getenv("PASSWORD")
HOST = os.getenv("HOST")
PORT = os.getenv("PORT")


files = os.listdir()
CSV_File = ""
Table_name = ""
for file in files:
    if file[-4:] == ".csv":
        CSV_File = file
        Table_name = file[:-4]
        df = pd.read_csv(CSV_File)
        df.columns = (
            df.columns.str.strip()
            .str.replace(" ", "_")
            .str.replace("[^a-zA-Z0-9_]", "")
        )
        dtype_mapping = {
            "int64": "INTEGER",
            "float64": "REAL",
            "object": "TEXT",
            "bool": "BOOLEAN",
            "datetime64[ns]": "DATE",
        }
        columns = []
        for col, dtype in df.dtypes.items():
            pg_type = dtype_mapping.get(str(dtype), "TEXT")  # Default to TEXT
            columns.append(f"{col} {pg_type}")

        columns_sql = ", ".join(columns)
        create_table_sql = f"CREATE TABLE IF NOT EXISTS {Table_name} ({columns_sql});"

        # Connect to PostgreSQL and create the table
        engine = create_engine(
            f"postgresql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}"
        )
        with engine.connect() as conn:
            # Create table
            conn.execute(text(create_table_sql))

        # Load the data into the PostgreSQL table
        df.to_sql(Table_name, engine, if_exists="append", index=False)

        print(f"Data from {CSV_File} successfully loaded into {Table_name}.")
