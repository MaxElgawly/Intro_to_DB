import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Connect to MySQL Server (change user/password/host if needed)
        connection = mysql.connector.connect(
            host="localhost",      # or your DB host, e.g. "127.0.0.1"
            user="root",           # your MySQL username
            password="password"    # your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            print("Database 'alx_book_store' created successfully!")
    
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    
    finally:
        # Close the connection properly
        if connection is not None and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()