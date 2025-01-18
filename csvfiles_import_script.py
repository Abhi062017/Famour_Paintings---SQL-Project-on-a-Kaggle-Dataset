import pandas as pd
from sqlalchemy import create_engine

conn_string = 'mysql+pymysql://root:Oct12024@localhost/sql_portfolio_projects'
db = create_engine(conn_string)
conn = db.connect()

files = ['artist', 'canvas_size', 'image_link', 'museum_hours', 'museum', 'product_size', 'subject', 'work']

for file in files:
    df = pd.read_csv(rf'E:\Career\SQL\techTFQ\Project 2 - Famous Paintings - Kaggle Dataset\Dataset/{file}.csv')
    df.to_sql(file, con=conn, if_exists='replace', index=False)
